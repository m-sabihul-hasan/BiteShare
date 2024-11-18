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
             dishName: "Chicken Biryani",
             description: "Savor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed.",
             ingredients: "Chicken, yogurt, ginger-garlic paste, red chili powder, turmeric powder, garam masala, salt, lemon juice, basmati rice, water, bay leaf, green cardamom pods, cloves, cinnamon stick, star anise (optional), onions, ghee or cooking oil, fresh mint leaves, fresh coriander leaves, saffron strands or food coloring, fried onions, nutmeg and mace powder  green chilies, boiled egg, and potato.",
             servingSize: 4, portionsLeft: 4, dishImage: Image("biryani")),
        
        Bite(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
             dishName: "Pizza Margherita",
             description: "Enjoy the simplicity of my homemade Pizza Margherita—a crisp, thin crust topped with rich San Marzano tomato sauce, fresh mozzarella, and fragrant basil. Each bite is pure Italian tradition, finished with a drizzle of extra-virgin olive oil for an authentic, savory experience.",
             ingredients: "All-purpose flour, salt, sugar, instant yeast, warm water, olive oil, canned San Marzano tomatoes, garlic (optional), dried oregano or fresh basil, fresh mozzarella cheese, fresh basil leaves, and extra virgin olive oil. Optional: semolina flour for dusting.",
             servingSize: 6, portionsLeft: 6, dishImage: Image("pizza")),
        
        Bite(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
             dishName: "Pasta Carbonara",
             description: "Indulge in my creamy homemade Carbonara, a true Italian classic! Perfectly cooked spaghetti is enveloped in a rich, velvety sauce made from fresh eggs, Pecorino Romano, and a touch of black pepper, all brought to life with crispy bites of pancetta. No cream added—just authentic, comforting flavors that melt together in every mouthful. A dish to savor and share.",
             ingredients: "Spaghetti, eggs, Parmesan cheese, Pecorino Romano cheese, guanciale (or pancetta), black pepper, and salt. Optional: garlic (lightly used) and parsley for garnish.",
             servingSize: 3, portionsLeft: 3, dishImage: Image("pasta")),
        
        Bite(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
             dishName: "Chicken Biryani",
             description: "Savor the rich flavors of my aromatic Chicken Biryani—a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed.",
             ingredients: "Chicken, yogurt, ginger-garlic paste, red chili powder, turmeric powder, garam masala, salt, lemon juice, basmati rice, water, bay leaf, green cardamom pods, cloves, cinnamon stick, star anise (optional), onions, ghee or cooking oil, fresh mint leaves, fresh coriander leaves, saffron strands or food coloring, fried onions, nutmeg and mace powder  green chilies, boiled egg, and potato.",
             servingSize: 3, portionsLeft: 3, dishImage: Image("biryani")),
        
        Bite(profile: Profile(name: "Maryam", surname: "Jeyhaninejad", nationality: "🇮🇷", profileImage: Image("maryam")),
             dishName: "Ghomerh Sabzi",
             description: "Delight in the authentic taste of my Ghormeh Sabzi—a beloved Persian stew bursting with tender herbs, tangy dried limes, and succulent lamb. Slowly simmered with kidney beans, this dish offers a harmony of savory and sour notes. A true taste of Iran, perfect for sharing with loved ones.",
             ingredients: "Fresh parsley, cilantro, fenugreek leaves, leek or scallions, dried limes (limoo omani), kidney beans, lamb or beef chunks, turmeric, onions, garlic (optional), vegetable oil, salt, and black pepper.",
             servingSize: 3, portionsLeft: 3, dishImage: Image("sabzi"))
        
    ]
    
    func add(_ bite: Bite) {
        bites.insert(bite, at: 0)
    }
    
}

