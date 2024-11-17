//
//  PartyDetailView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import SwiftUI

struct CookPartyDetailView: View {
    
    @State var showModal: Bool = false
    
    @State var host: Host
    
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
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
                
                ScrollView
                {
                    
                    Text("\(host.description) \nJoin me at \(host.location) on \(host.dateOfEvent) \nAvailable slots: \(host.spot) \nAttendees: \n\(host.attendees.joined(separator: "\n"))")
                        .lineSpacing(12)
                        .frame(width: UIScreen.main.bounds.width - 70, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray.opacity(0.2)) // Background color
                        .cornerRadius(10) // Rounded corners for the background

                }
                .frame(height: 300)
            
            Spacer()
            
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
            
            Spacer()
            
        }
        .sheet(isPresented: $showModal, content: {BookPartyModal(showModal: $showModal, host: $host)})
    }
    
}


#Preview {
    CookPartyDetailView(
        host:     Host(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")), description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", attendees: ["Sabih" , "Maria", "Filippo"], spot: 5, spotLeft: 2)
    ).environment(HostViewModel())
}
