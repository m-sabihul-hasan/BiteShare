//
//  TabView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 11/11/24.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            Tab("Today's Special", systemImage: "fork.knife.circle") {
                BiteView()
            }
            
            Tab("Cook Party", systemImage: "party.popper") {
               CookPartyView()
            }
            
            Tab("Profile", systemImage: "person.fill") {
               ProfileView()
            }
        }
    }
}

#Preview {
    TabsView().environment(BiteViewModel())
}
