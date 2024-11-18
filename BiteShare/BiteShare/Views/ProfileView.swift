//
//  ProfileView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 17/11/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var nationality: String = "🇪🇺"
    @State private var profileImage: Image = Image("noimage")
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Details")) {
                    TextField("First Name", text: $name)
                    TextField("Last Name", text: $surname)
                    
                    Picker("Nationality", selection: $nationality) {
                        ForEach(["🇪🇺", "🇵🇰", "🇮🇹", "🇮🇳", "🇮🇷", "🇺🇸", "🇬🇧", "🇫🇷"], id: \.self) { flag in
                            Text(flag).tag(flag)
                        }
                    }
                }
                
                Section(header: Text("Profile Picture")) {
                    profileImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .onTapGesture {
                            showImagePicker = true
                        }
                }
            }
            .navigationBarTitle("Create Profile")
            .navigationBarItems(trailing: Button("Save") {
                saveProfile()
            })
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func saveProfile() {
        guard !name.isEmpty, !surname.isEmpty else { return }
        let newProfile = Profile(name: name, surname: surname, nationality: nationality, profileImage: profileImage)
        profileViewModel.add(newProfile)
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
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
