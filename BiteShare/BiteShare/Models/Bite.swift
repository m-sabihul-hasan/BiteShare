//
//  Bite.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import Foundation
import SwiftUI

struct Bite: Identifiable {
    
    var id: UUID = UUID()
    var profile: Profile
    var dishName: String
    var description: String = "No description"
    var ingredients: String = "No ingredients"
    var servingSize: Int = 0
    var portionsLeft: Int = 0
    var attendees: [String] = []
    var dishImage: Image = Image(systemName: "fork.knife.cricle")
    
}
