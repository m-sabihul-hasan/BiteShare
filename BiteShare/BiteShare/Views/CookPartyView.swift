//
//  CookPartyView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import SwiftUI

struct CookPartyView: View {
    
    @Environment(HostViewModel.self) var hostVM
    @State var showModal: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(hostVM.hosts) { host in
                    
                    NavigationLink {
                        PartyDetailView()
                    } label: {
                        HStack {
                            host.profileImage
                            
                            Text(host.name)
                            Text(host.surname)
                        }
                    }
                }
//                .onDelete(perform: hostVM.delete)
                
            }
            .sheet(isPresented: $showModal, content: {PostBiteModal(showModal: $showModal)})
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    })
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
