//
//  ContentView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 06/11/24.
//

import SwiftUI
import PhotosUI

struct LaunchView: View {
    @State private var animationActive = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            Image("launch") // Replace with your image
                .resizable()
//                .scaledToFit()
                .frame(width: 400, height: 370)
                .foregroundColor(.yellow)
                .overlay(
                    ShineEffect() // Custom shine effect overlay
                        .mask(Image("launch")
                            .resizable()
//                            .scaledToFit()
                              )
                        .frame(width: 400, height: 370)
                        .opacity(animationActive ? 1 : 0)
                )
        }
        .onAppear {
            animationActive = true
        }
    }
}

// Shine effect as a reusable view
struct ShineEffect: View {
    @State private var shinePosition: CGFloat = -1

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.3), Color.clear]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .mask(Rectangle().offset(x: shinePosition * 300))
        .onAppear {
            withAnimation(.easeInOut(duration: 2)
//                .repeatForever(autoreverses: false)
            ) {
                shinePosition = 1
            }
        }
    }
}

#Preview {
    LaunchView()
}
