//
//  PartyDetailView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import SwiftUI

struct CPartyDetailView: View {
    
    @State var showModal: Bool = false
    
    var host: Host
    
    
    var body: some View {
        
        VStack {
            VStack {
                
                Text("Book \(host.name)'s Party")
                    .font(.title)
                    .bold()
                
                HStack{
                    
                    host.profileImage?
                        .resizable()
                        .scaledToFit()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(10)
                        .clipShape(Circle()) // Clip image to circle
                        .overlay(
                            Circle().stroke(Color.blue.opacity(0.5), lineWidth: 4) // Add circular border
                        )
                        .padding()
                    
                    VStack{
                        Text("\(host.name) \(host.surname)")
                            .italic()
                        
                        Text("\(host.nationality)")
                    }
                }
                
                Text("\(host.description) \nJoin me at \(host.location) on \(host.dateOfEvent) \nAvailable slots: \(host.spot)")
                    .lineSpacing(12)
                    .padding()
                    .background(Color.gray.opacity(0.2)) // Background color
                    .cornerRadius(10) // Rounded corners for the background
                    .padding(.horizontal, 30)
                
            }
            .offset(y: -130)
            
            Button(action: {
                showModal.toggle()
            }, label: {
                Text("Book a slot")
            })
            .padding()
            .bold()
            .background(Color(hex: "#FF9640"))
            .foregroundStyle(.black)
            .cornerRadius(15)
            .offset(y: 50)
        }
        .sheet(isPresented: $showModal, content: {PostBiteModalView(showModal: $showModal)})
    }
    
}


#Preview {
    CPartyDetailView(
        host:     Host(name: "Maria", surname: "Petrillo", description: "I wanna make pasta Nerano join me if you are interested Saturday night", location: "Pozzouli 354", dateOfEvent: "Saturday 16th November 2024 at 19:00", spot: 3, nationality: "🇮🇹", profileImage: Image("girl"))
    )
}
