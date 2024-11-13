//
//  Member.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 13/11/24.
//

import Foundation
import SwiftUI

struct Profile: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var surname: String
    var nationality: String = "🇪🇺"
    var profileImage: Image = Image("noimage")
    
}
