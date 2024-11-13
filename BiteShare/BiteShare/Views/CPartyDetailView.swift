//
//  PartyDetailView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import SwiftUI

struct CPartyDetailView: View {
    
    var host: Host
    
    
    var body: some View {
        VStack {
            
            Text("Book" + " \(host.name)" + "'s Party")
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
                
                Text("\(host.description)")
                
                
                
            }
            
        }
    }
}


#Preview {
    CPartyDetailView(
        host:     Host(name: "Maria", surname: "Petrillo", description: "I'm strong", spot: 3, nationality: "🇮🇹", profileImage: Image("girl"))
    )
}
