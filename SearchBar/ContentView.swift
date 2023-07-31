//
//  ContentView.swift
//  SearchBar
//
//  Created by Dilshad N on 05/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var focusedField: Bool
    @State var fruits = [FruitModel]()
    @State var searchText: String = ""
    
    var searchResult:[FruitModel] {
        if searchText.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    TextField("Search here...", text: $searchText)
                        .focused($focusedField)
                        .onTapGesture {
                            focusedField = true
                            print("|| TextField tappped || ")
                        }
                }
                .padding(.vertical, 10)
                .padding(.leading, 30)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                        
                        if focusedField && !searchText.isEmpty {
                            Button {
                                self.searchText = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 20)
                            }
                            
                        }
                        
                    })
                ZStack {
                    List {
                        //                        ForEach(searchText.isEmpty ? fruits : fruits.filter{ $0.name.localizedCaseInsensitiveContains(searchText)}, id: \.id) { fruit in
                        ForEach(searchResult, id: \.id) { fruit in
                            NavigationLink() {
                                Text(fruit.name)
                                
                            } label: {
                                HStack {
                                    Image(systemName: "person.fill")
                                    Text(fruit.name)
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                
                            }
                            
                            
                        }
                        
                        //                    .listRowSeparatorTint(.red)
                        .listRowSeparator(.hidden)
                    }
                    
                }
                .navigationTitle("Fruits")
                
            }
            .task {
                await fetchFruits()
            }
        }
    }
    
    
    // Network request
    func fetchFruits() async {
        // Create URL
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else {
            print("Invalid Url")
            return
        }
        // fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode that data
            if let decodedData = try? JSONDecoder().decode([FruitModel].self, from: data) {
                fruits = decodedData
            }
            
        } catch {
            print("Data isn't valid🙃")
        }
    }
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
