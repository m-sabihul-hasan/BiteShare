//
//  PostBiteModal.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 11/11/24.
//

import SwiftUI

struct PostBiteModal: View {
    
    @State var name: String = ""
    @State var description: String = ""
    @State var count: Int = 0
    
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationStack{
            Form {
                
                Section() {
                    TextField("Name of Dish", text: $name)
                }
                Section() {
                    TextField("Description", text: $description)
                }
                Section() {
                    HStack {
                        Text("Serving Size")
                        Spacer() // Pushes the counter to the right
                        
                        // Minus button
                        Button(action: {
                            if count > 0 {count -= 1} // Decrease count, but avoid negative values
                        }) {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                                .font(.title2)
                        }
                        
                        // Display current count
                        Text("\(count)")
                            .font(.title2)
                            .frame(minWidth: 40) // Space for the count display
                        
                        // Plus button
                        Button(action: {
                            count += 1 // Increase count
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showModal.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        showModal.toggle()
                    }
                }
            }
            .navigationTitle("Share a Bite?")
            
        }
    }
    
}

#Preview {
    PostBiteModal(showModal: .constant(true))
}
