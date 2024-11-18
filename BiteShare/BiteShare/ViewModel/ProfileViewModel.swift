//
//  MemberViewModel.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import Foundation
import SwiftUI


class ProfileViewModel: ObservableObject {
    
    @Published var profiles = [
        Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
        Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
        Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
        Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
        Profile(name: "Maryam", surname: "Jeyhaninejad", nationality: "🇮🇷", profileImage: Image("maryam"))
    ]
    
    @Published var selectedProfile: Profile?
    
    func add(_ profile: Profile) {
        profiles.insert(profile, at: 0)
    }
}


