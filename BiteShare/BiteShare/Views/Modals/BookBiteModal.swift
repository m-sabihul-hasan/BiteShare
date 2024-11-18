//
//  BookBiteModal.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 17/11/24.
//

import SwiftUI

struct BookBiteModal: View {
    
    @Environment(BiteViewModel.self) var biteVM
    
    @ObservedObject var profileVM = ProfileViewModel()
    
    @State var count: Int = 0
    
    @Binding var activeSheet: ActiveSheet?
    
    @Binding var bite: Bite
    
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
                                Text("Book  \(bite.profile.name)'s Special \(bite.profile.nationality)")
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
                            
                            Stepper(value: $count, in: 0...bite.portionsLeft) {
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
                        if bite.portionsLeft != 0 {
                            if count > 1 {
                                bite.attendees.append("\(selectedProfile.name) \(selectedProfile.surname) +\(count - 1)")
                            }
                            else
                            {
                                bite.attendees.append("\(selectedProfile.name) \(selectedProfile.surname)")
                            }
                        }
                            bite.portionsLeft -= count
                        activeSheet = nil
                    }
                },
                       label: {
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


//#Preview {
//    let mockBite = Bite(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
//                        dishName: "Pizza Margherita",
//                        description: "Enjoy the simplicity of my homemade Pizza Margherita—a crisp, thin crust topped with rich San Marzano tomato sauce, fresh mozzarella, and fragrant basil. Each bite is pure Italian tradition, finished with a drizzle of extra-virgin olive oil for an authentic, savory experience.",
//                        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//                        servingSize: 6, portionsLeft: 6, attendees: ["Sabih", "Maryam", "Sakshi"], dishImage: Image("pizza"))
//    BookBiteModal(activeSheet: .constant(true), bite: .constant(mockBite)).environment(BiteViewModel())
//}
