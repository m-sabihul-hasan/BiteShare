//
//  HostViewModel.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import Foundation
import SwiftUI

@Observable
class HostViewModel {
    
    var hosts = [
        Host(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354",
             dateOfEvent: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 17, hour: 14, minute: 30)) ?? Date(),  spot: 5),
        Host(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354",
             dateOfEvent: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 12, hour: 14, minute: 30)) ?? Date(), spot: 4),
        Host(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354",
             dateOfEvent: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 17, hour: 14, minute: 30)) ?? Date(), spot: 3),
        Host(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354",
             dateOfEvent: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 17, hour: 14, minute: 30)) ?? Date(), spot: 2),
        Host(profile: Profile(name: "Maryam", surname: "Jeyhaninejad", nationality: "🇮🇷", profileImage: Image("maryam")),
             description: "I'm invincible", location: "Pozzouli 354",
             dateOfEvent: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 20, hour: 14, minute: 30)) ?? Date(), spot: 2)
    ]
    
    func add(_ host: Host) {
        hosts.insert(host, at: 0)
    }
}

