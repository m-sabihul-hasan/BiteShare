//
//  CookPartyView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import SwiftUI

struct CookPartyView: View {
    
    var hostVM = HostViewModel()
    @State var showModal: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(hostVM.hosts) { host in
                    
                    NavigationLink(destination: CookPartyDetailView(host: host)) {
                        
                        HStack {
                            // Extract the image part to avoid inline modification
                            let profileImage = host.profile.profileImage
                            profileImage
                                .resizable()
                                .frame(width: 25, height: 30)
                                .offset(x: -5)
                            
                            // Extract the text part for easier readability
                            let partyText = "\(host.profile.name)'s Party \(host.profile.nationality)"
                            Text(partyText)
                                .padding(.horizontal, 3)
                        }
                    }
                }
                // Uncomment if you want to add delete functionality
                // .onDelete(perform: hostVM.delete)
            }
            .sheet(isPresented: $showModal) {
                CookPartyModal(showModal: $showModal)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showModal.toggle()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Cook Party")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CookPartyView()
}
