//
//  BiteShareApp.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 06/11/24.
//

import SwiftUI

@main
struct BiteShareApp: App {
    // State variable to control which view to show
        @State private var showLaunchScreen = true
    @StateObject private var profileVM = ProfileViewModel()
        
        var body: some Scene {
            WindowGroup {
                if showLaunchScreen {
                    LaunchView()
                        .onAppear {
                            // Delay for 2 seconds, then switch to the main view
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showLaunchScreen = false
                            }
                        }
                } else {
                    TabsView()
                        .environment(BiteViewModel())
                        .environment(HostViewModel())
                        .environmentObject(ProfileViewModel())
                }
            }
        }}


