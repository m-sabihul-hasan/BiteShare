//
//  SwiftUIView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 06/11/24.
//

import SwiftUI

struct LogInView: View {
    @State private var selectedOption = "Option 1"
    @State private var isNextPageActive = false  // Tracks if navigation should happen
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    var body: some View {
        NavigationStack
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
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.2))
                    
                    // NavigationLink with programmatic activation
                    NavigationLink(destination: ContentView(), isActive: $isNextPageActive){
                        EmptyView()
                    }
                    
                }
                .onChange(of: selectedOption) {
                    isNextPageActive = true // Trigger navigation on selection change
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
    LogInView()
}
