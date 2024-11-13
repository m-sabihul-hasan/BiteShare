//
//  PostBiteModal.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 11/11/24.
//

import SwiftUI
import PhotosUI

struct PostBiteModal: View {
    
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImage: Image? = nil
    
    @State var name: String = ""
    @State var dishName: String = ""
    @State var description: String = ""
    @State var count: Int = 0
    
    @Binding var showModal: Bool
    
    @StateObject var profileVM = ProfileViewModel()
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    HStack {
                        Spacer() // Center-align the text
                        Text("Share a Bite")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        Spacer()
                    }
                }
                .listRowInsets(EdgeInsets()) // Remove default insets for a full-width appearance
                .background(Color(UIColor.systemGroupedBackground)) // Matches form background color
                .frame(height: 10)
                
                Section()
                {
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ){
                        HStack {
                            Text("Select Image")
                                .foregroundStyle(Color.black.opacity(0.3))
                            //                                .font(.title3)
                            Image(systemName: "photo.badge.plus")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundStyle(.black.opacity(0.3))
                                .offset(x: 190)
                        }
                    }
                    .onChange(of: selectedItem) {
                        Task {
                            // Load image data if an item is selected
                            if let selectedItem,
                               let data = try? await selectedItem.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                // Convert UIImage to SwiftUI Image
                                selectedImage = Image(uiImage: uiImage)
                            }
                        }
                    }
                    
                    // Display the selected image if available
                    if let selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
                .frame(minWidth: 0, minHeight: 50, maxHeight: .infinity)
                
                
                Section() {
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
                
                Section() {
                    TextField("Name of Dish", text: $dishName)
                }
                Section() {
                    TextField("Description", text: $description)
                }
                Section() {
                    HStack {
                        Text("Serving Size")
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
            //            .navigationTitle("Share a Bite?")
            //            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showModal.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        showModal.toggle()
                    }
                }
            }
            
        }
    }
}

#Preview {
    PostBiteModal(showModal: .constant(true))
}



//                Section() {
//                    HStack {
//                        Text("Serving Size")
//                        Spacer()
//
//                        // Minus button
//                        Button(action: {
//                            if count > 0
//                            {
//                                count -= 1
//                                print("Decremented count: \(count)")
//                            } // Decrease count, but avoid negative values
//                        })
//                        {
//                            Image(systemName: "minus.circle")
//                                .foregroundColor(.red)
//                                .font(.title2)
//                        }
//
//                        // Display current count
//                        Text("\(count)")
//                            .font(.title2)
//                            .frame(minWidth: 40)
//
//                        // Plus button
//                        Button(action: {
//                            count += 1 // Increase count
//                            print("Incremented count: \(count)")
//                        })
//                        {
//                            Image(systemName: "plus.circle")
//                                .foregroundColor(.green)
//                                .font(.title2)
//                        }
//                    }
//                }
