//
//  CookPartyModal.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import SwiftUI
import PhotosUI

struct CookPartyModal: View {
    
    @Environment(HostViewModel.self) var hostVM
    
    @ObservedObject var profileVM = ProfileViewModel()
    
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImage: Image? = nil
    
    @State var dateOfEvent: Date = Date()
    @State var location: String = ""
    @State var description: String = ""
    @State var count: Int = 0
    
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    VStack {
                        HStack {
                            Spacer() // Center-align the text
                            Text("Host a Party")
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
                    
                    DatePicker(
                        "When?",
                        selection: $dateOfEvent,
                        in: Date()..., // You can set a minimum date here if needed
                        displayedComponents: [.date, .hourAndMinute] // Show both date and time
                    )
                }
                
                Section() {
                    TextField("Where", text: $location)
                }
                Section() {
                    TextField("Description", text: $description)
                }
                Section() {
                    HStack {
                        Text("How many spots?")
                        Spacer()
                        
                        Stepper(value: $count, in: 0...10) {
                            // Display current count
                            Text("\(count)")
                                .font(.title2)
                                .offset(x: 60)
                        }
                    }
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showModal.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        if let selectedProfile = profileVM.selectedProfile {
                            let newHost = Host(
                                profile: selectedProfile,
                                description: description,
                                location: location,
                                dateOfEvent: dateOfEvent,
                                spot: count,
                                spotLeft: count
                            )
                            hostVM.add(newHost)
                            showModal.toggle()
                        }
                    }
                }
            }
            
        }
    }
    
}

#Preview {
    CookPartyModal(showModal: .constant(true)).environment(HostViewModel())
}
