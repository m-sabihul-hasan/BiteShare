//
//  HomeView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 08/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
        }
        .background(Color(hex: "#20808E"))
    }
}

#Preview {
    HomeView()
}
