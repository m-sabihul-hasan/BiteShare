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
                    
                    NavigationLink {
                        CPartyDetailView(host: host)
                    } label: {
                        HStack {
                            host.profileImage
                                .resizable()
                                .frame(width: 25, height: 30)
                                .offset(x: -5)
                            
                            Text("\(host.name)" + "'s Party " + "\(host.nationality)")
                                .padding(.horizontal, 3)
                        }
                    }
                }
//                .onDelete(perform: hostVM.delete)
                
            }
            .sheet(isPresented: $showModal, content: {CookPartyModal(showModal: $showModal)})
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
