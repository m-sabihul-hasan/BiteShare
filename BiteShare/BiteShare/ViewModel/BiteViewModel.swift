//
//  BiteViewModel.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import Foundation
import SwiftUI

//@Observable
class BiteViewModel: ObservableObject {
    
    // A list of `Bite` objects
    @Published var bites = [
        Bite(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("boy")),
             dishName: "Biryani", description: "Delicious spicy rice", servingSize: 4, dishImage: Image("biryani")),
        
        Bite(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("boy")),
             dishName: "Pizza", description: "Authentic Italian pizza", servingSize: 6, dishImage: Image("pizza")),
        
        Bite(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("girl")),
             dishName: "Pasta", description: "Creamy Alfredo pasta", servingSize: 3, dishImage: Image("pasta")),
        
        Bite(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("girl")),
             dishName: "Pasta", description: "Creamy Alfredo pasta", servingSize: 3, dishImage: Image("pasta")),
        
        Bite(profile: Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("girl")),
             dishName: "Pasta", description: "Creamy Alfredo pasta", servingSize: 3, dishImage: Image("pasta"))
        
    ]
    
    // Optionally, track a selected bite if needed
    @Published var selectedBite: Bite?
    
    // Method to add a new bite
    func addBite(_ bite: Bite) {
        bites.append(bite)
    }
    
}

