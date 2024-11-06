//
//  SwiftUIView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 06/11/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var selectedOption = "Option 1"
        let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    var body: some View {
        NavigationView
        {
            VStack {
                VStack {
                    Text("Log in")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .font(.title)
                                .foregroundColor(Color.black)
                                .tag(option)
                            
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(width: 350 , height: 50)
                    //            .padding()
                    .background(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)  // Border around the picker
                    )
//                    .shadow(radius: 5)  // Add shadow for effect
                    .cornerRadius(8)
                    
                    Text("Selected: \(selectedOption)")
                        .padding()
                }
                
                ZStack
                {
                    Image("Path")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("Path2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(y: 64)
                }
                .offset(y: 100)
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
