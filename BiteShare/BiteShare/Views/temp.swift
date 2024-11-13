//
//  temp.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import SwiftUI
import PhotosUI

struct temp: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    var body: some View {
        VStack {
              ZStack {
                  // Circular background
                  Circle()
                      .stroke(Color.blue.opacity(0.5), lineWidth: 4) // Add circular border
                      .frame(width: 120, height: 120) // Size of the circular section
                      .padding(10)
                  
                  if let selectedImage {
                      // Show selected image, centered in the circle
                      selectedImage
                          .resizable()
                          .scaledToFill()
                          .frame(width: 100, height: 100) // Adjust size as needed
                          .clipShape(Circle()) // Clip image to circle
                          
                      
                  } else {
                      // Show placeholder image picker icon in the center
                      PhotosPicker(
                          selection: $selectedItem,
                          matching: .images,
                          photoLibrary: .shared()
                      ) {
                          VStack {
                              Image(systemName: "person.fill.badge.plus")
                                  .resizable()
                                  .frame(width: 60, height: 60)
                                  .foregroundStyle(.black.opacity(0.3))
                                  .offset(x: 5)
                          }
                      }
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
          }
          .padding()
    }
}

#Preview {
    temp()
}
