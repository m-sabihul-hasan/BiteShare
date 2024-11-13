//
//  SwiftUIView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 06/11/24.
//

import SwiftUI

struct LogInView: View {
    @State private var selectedOption = "Filipo Caliendo"
    @State private var isNextPageActive = false  // Tracks if navigation should happen
    let options = ["Filipo Caliendo", "Muhammad Sabihul Hasan", "Sakshi Sindgi", "Option 4"]
    
    var body: some View {
        NavigationStack
        {
            VStack {
                VStack {
                    Text("Log in")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    HStack{
                        
                        // Custom dropdown button with Menu
                        Menu {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    selectedOption = option
                                }) {
                                    Text(option)
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedOption)
                                    .font(.title3)
                                    .foregroundColor(Color.black)
                                
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color(hex: "#4298A5"))
                                    .offset(x: 90)
                                    .frame(width: 20, height: 20)
                            }
                            .frame(width: 350, height: 50)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 0.2)
                            )
                        }
                    }
                    
                    // NavigationLink with programmatic activation
                    NavigationLink(destination: TabsView(), isActive: $isNextPageActive){
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
