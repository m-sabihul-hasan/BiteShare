//
//  HomeView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 08/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
            }
            .background(Color(hex: "#20808E"))
                HStack{
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                    
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text("Search")
                                .bold()
                                .foregroundColor(.white.opacity(0.6)) // Placeholder color
                        }
                        TextField("", text: $text)
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(width: 300, height: 25)
                    Image(systemName: "mic")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)

            }
                .padding(.horizontal)
                .padding(.vertical)
                .background(RoundedRectangle(cornerRadius: 15, style:.continuous)
                    .fill(.white.opacity(0.1)))
                .offset(y: -300)
            
            Button("New Post")
            {
                
            }
            .padding()
            .background(.purple)
            .foregroundStyle(.black)
            .cornerRadius(15)
        }
    }
}

#Preview {
    HomeView()
}