//
//  ProfileView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 17/11/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var nationality: String = ""
    @State private var profileImage: Image = Image(systemName: "person.fill.badge.plus")
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    @State private var showAlert: Bool = false // State for the alert
    
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
                                Text("Create Profile")
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
                                        
                                        profileImage
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 100, height: 100)
                                            .foregroundStyle(.black.opacity(0.5))
                                            .onTapGesture {
                                                showImagePicker = true
                                            }
                                        
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets()) // Remove default insets for a full-width appearance
                    .background(Color(UIColor.systemGroupedBackground)) // Matches form background color
                    
                    
                    
                    Section() {
                        TextField("Name", text: $name)
                    }
                    Section() {
                        TextField("Surname", text: $surname)
                    }
                    Section() {
                        
                        Picker("Nationality", selection: $nationality) {
                            ForEach(["🇪🇺", "🇵🇰", "🇮🇹", "🇮🇳", "🇮🇷", "🇺🇸", "🇬🇧", "🇫🇷"], id: \.self) { flag in
                                Text(flag).tag(flag)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            
                            guard let validInputImage = inputImage else {
                                print("No image selected!") // Handle the case where inputImage is nil
                                return
                            }
                            let newProfile = Profile(
                                name : name,
                                surname: surname,
                                nationality: nationality,
                                profileImage: Image(uiImage: validInputImage)
                            )
                            profileViewModel.add(newProfile)
                            showAlert = true
                        },
                               label: {
                            Text("Save")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding()
                        }
                        )
                               
                    }
                }
            }
            .offset(y: 100)
            .background(Color(hex: "#20808E"))
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .alert("Profile Created", isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    clearFields() // Clear fields when alert is dismissed
                }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
        
    }
    
    func clearFields() {
            // Reset all fields
            name = ""
            surname = ""
            nationality = ""
            inputImage = nil
            profileImage = Image(systemName: "person.fill.badge.plus")
        }
}

// A helper struct for picking images from the photo library
struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}


#Preview {
    ProfileView().environmentObject(ProfileViewModel())
}
