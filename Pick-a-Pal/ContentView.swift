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
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? " " : pickedName)
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
            Divider()
            Toggle("Remove Picked Name", isOn: $shouldRemovePickedName)
            Button("Picked Random Name") {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                } else {
                    pickedName = ""
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
