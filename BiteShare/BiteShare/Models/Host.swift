//
//  Host.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import Foundation
import SwiftUI

struct Host: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var surname: String
    var description: String = "No Description"
    var location: String = "No Location"
    var dateOfEvent: String = "No Date"
    var spot: Int = 0
    var nationality: String = "🇪🇺"
    var profileImage: Image?  // Optional Image property
    
//    var profileImageData: Data?  // Data property to store the image persistently
//    
//    // Computed property to convert Data to UIImage
//    var profileImage: Image? {
//        guard let data = profileImageData, let uiImage = UIImage(data: data) else {
//            return nil
//        }
//        return Image(uiImage: uiImage)
//    }
}
