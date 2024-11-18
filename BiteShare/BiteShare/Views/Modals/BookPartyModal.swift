//
//  BookPartyModal.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 17/11/24.
//

import SwiftUI

struct BookPartyModal: View {
    
    @Environment(HostViewModel.self) var hostVM
    
    @ObservedObject var profileVM = ProfileViewModel()
    
    @State var count: Int = 0
    
    @Binding var showModal: Bool
    
    @Binding var host: Host
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("bg_new")
                    .resizable()
                    .ignoresSafeArea()
                
                Form {
                    Section() {
                        VStack {
                            HStack {
                                Spacer() // Center-align the text
                                Text("Book \(host.profile.name)'s Party")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                VStack {
                                    ZStack{
                                        Circle()
                                            .stroke(Color.blue.opacity(0.5), lineWidth: 4) // Add circular border
                                            .frame(width: 130, height: 130) // Size of the circular section
                                            .padding(10)
                                        
                                        // Profile image display in a circle
                                        if let selectedProfile = profileVM.selectedProfile {
                                            selectedProfile.profileImage
                                                .resizable()
                                            //                                            .scaledToFit()
                                                .clipShape(Circle())
                                                .frame(width: 110, height: 130)
                                            
                                            
                                            
                                        } else {
                                            VStack {
                                                Image(systemName: "person.fill.badge.plus")
                                                    .resizable()
                                                    .frame(width: 60, height: 60)
                                                    .foregroundStyle(.black.opacity(0.3))
                                                    .offset(x: 5)
                                            }
                                        }
                                    }
                                    Menu {
                                        ForEach(profileVM.profiles) { profile in
                                            Button("\(profile.name) \(profile.surname)") {
                                                // Update the selected profile in the view model
                                                profileVM.selectedProfile = profile
                                            }
                                        }
                                    } label: {
                                        Text(profileVM.selectedProfile.map { "\($0.name) \($0.surname)" } ?? "Select Profile")
                                            .foregroundStyle(.black)
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets()) // Remove default insets for a full-width appearance
                    .background(Color(UIColor.systemGroupedBackground)) // Matches form background color
                    
                    Section() {
                        HStack {
                            Text("How many spots?")
                            Spacer()
                            
                            Stepper(value: $count, in: 0...host.spot) {
                                // Display current count
                                Text("\(count)")
                                    .font(.title2)
                                    .offset(x: 60)
                            }
                        }
                    }
                }
                .offset(y: 160)
                
                Button(action: {
                    if let selectedProfile = profileVM.selectedProfile {
                        if host.spot != 0 {
                            if count > 1 {
                                host.attendees.append("\(selectedProfile.name) \(selectedProfile.surname) +\(count - 1)")
                            }
                            else
                            {
                                host.attendees.append("\(selectedProfile.name) \(selectedProfile.surname)")
                            }
                        }
                        host.spot -= count
                        showModal.toggle()
                    }
                }, label: {
                    Text("Book")
                })
                .frame(width: 80)
                .padding()
                .bold()
                .background(Color(hex: "#FF9640"))
                .foregroundStyle(.black)
                .cornerRadius(15)
                .offset(y: 250)
            }
            .background(Color(hex: "#20808E"))
            .offset(y: -10)
            
        }
    }
}

#Preview {
    let mockHost =   Host(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")), description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", attendees: ["Sabih" , "Maria", "Filippo"], spot: 4)
    BookPartyModal(showModal: .constant(true), host: .constant(mockHost)).environment(HostViewModel())
}
