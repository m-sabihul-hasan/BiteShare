//
//  BiteViewModel.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import Foundation
import SwiftUI

@Observable
class BiteViewModel {
    
    var bites = [
        Bite(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
             dishName: "Chicken Biryani", description: "Savor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed.", servingSize: 4, dishImage: Image("biryani")),
        
        Bite(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
             dishName: "Pizza Margherita", description: "Enjoy the simplicity of my homemade Pizza Margherita—a crisp, thin crust topped with rich San Marzano tomato sauce, fresh mozzarella, and fragrant basil. Each bite is pure Italian tradition, finished with a drizzle of extra-virgin olive oil for an authentic, savory experience.", servingSize: 6, dishImage: Image("pizza")),
        
        Bite(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
             dishName: "Pasta Carbonara", description: "Indulge in my creamy homemade Carbonara, a true Italian classic! Perfectly cooked spaghetti is enveloped in a rich, velvety sauce made from fresh eggs, Pecorino Romano, and a touch of black pepper, all brought to life with crispy bites of pancetta. No cream added—just authentic, comforting flavors that melt together in every mouthful. A dish to savor and share.", servingSize: 3, dishImage: Image("pasta")),
        
        Bite(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
             dishName: "Chicken Biryani", description: "Savor the rich flavors of my aromatic Chicken Biryani—a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed.", servingSize: 3, dishImage: Image("biryani")),
        
        Bite(profile: Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("maryam")),
             dishName: "Ghomerh Sabzi", description: "Delight in the authentic taste of my Ghormeh Sabzi—a beloved Persian stew bursting with tender herbs, tangy dried limes, and succulent lamb. Slowly simmered with kidney beans, this dish offers a harmony of savory and sour notes. A true taste of Iran, perfect for sharing with loved ones.", servingSize: 3, dishImage: Image("sabzi"))
        
    ]
    
    func add(_ bite: Bite) {
        bites.insert(bite, at: 0)
    }
        
}

