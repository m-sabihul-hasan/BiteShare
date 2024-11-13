//
//  MemberViewModel.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import Foundation
import SwiftUI

//@Observable
class ProfileViewModel: ObservableObject {
    
    @Published var profiles = [
        Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("boy")),
        Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("boy")),
        Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("girl")),
        Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("girl")),
        Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("girl"))
    ]
    
    @Published var selectedProfile: Profile?
    
//    init() {
//        // Default to the first profile in the list if available
//        self.selectedProfile = profiles.first
//    }
}


