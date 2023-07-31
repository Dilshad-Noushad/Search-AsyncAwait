//
//  ContentView.swift
//  Search-SwiftUI
//
//  Created by Dilshad N on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: viewModel = viewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await vm.fetchCharacter()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
