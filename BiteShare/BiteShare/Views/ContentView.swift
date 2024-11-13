//
//  ContentView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 06/11/24.
//

import SwiftUI
import PhotosUI

struct ImageUploadForm: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil

    var body: some View {
        Form {
            Section(header: Text("Upload Image")) {
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Label("Select Photo", systemImage: "photo")
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
        }
        .navigationTitle("Image Upload Form")
    }
}

#Preview {
    ImageUploadForm()
}
