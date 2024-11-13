//
//  PartyDetailView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import SwiftUI

struct CookPartyDetailView: View {
    
    @State var showModal: Bool = false
    
    var host: Host
    
    
    var body: some View {
        
        VStack {
            VStack {
                
                Text("Book \(host.profile.name)'s Party")
                    .font(.title)
                    .bold()
                
                HStack{
                    
                    host.profile.profileImage
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
                        Text("\(host.profile.name) \(host.profile.surname)")
                            .italic()
                        
                        Text("\(host.profile.nationality)")
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
        .sheet(isPresented: $showModal, content: {PostBiteModal(showModal: $showModal)})
    }
    
}


#Preview {
    CookPartyDetailView(
        host:     Host(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("girl")), description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 3)
    )
}
