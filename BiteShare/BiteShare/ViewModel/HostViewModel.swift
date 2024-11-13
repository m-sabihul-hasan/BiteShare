//
//  HostViewModel.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import Foundation
import SwiftUI

//@Observable
class HostViewModel {
    
    var hosts = [
        Host(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("boy"), description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", dateOfEvent: "", spot: 5),
        Host(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("boy"), description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", dateOfEvent: "", spot: 4),
        Host(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("girl"), description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", dateOfEvent: "", spot: 3),
        Host(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("girl"), description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", dateOfEvent: "", spot: 2),
        Host(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("girl"), description: "I'm invincible", location: "Pozzouli 354", dateOfEvent: "", spot: 2)
    ]
    
    func add(_ host: Host) {
        hosts.insert(host, at: 0)
    }
}

