//
//  ViewModel.swift
//  Search-SwiftUI
//
//  Created by Dilshad N on 31/07/23.
//

import Foundation

class viewModel: ObservableObject {
    @Published var character = [Welcome]()
    
    //MARK: - Network request
    func fetchCharacter() async {
        /// Create URL
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else {
            print("Invalid URL")
            return
        }
        /// Fetch data from URL
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            /// Decode that data
            if let decodedData = try? JSONDecoder().decode([Welcome].self, from: data) {
                character = decodedData
            }
                
        } catch {
            print("Data isn't valid")
            print(error.localizedDescription)
        }
    }
}
