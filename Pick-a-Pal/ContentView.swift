//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Łukasz Adamczak on 24/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Elisha", "Andrea", "Monica", "Eugene"]
    @State private var addName: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            
            TextField("Add Name:", text: $addName)
                .autocorrectionDisabled(true)
                .onSubmit {
                    if !addName.isEmpty {
                        names.append(addName)
                        addName = ""
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
