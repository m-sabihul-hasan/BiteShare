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
    var profile: Profile
    var description: String = "No Description"
    var location: String = "No Location"
    var attendees: [String] = []
    var dateOfEvent: Date = Date()
    var spot: Int = 5
    var spotLeft: Int = 5

}
