//
//  HostViewModel.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 12/11/24.
//

import Foundation
import SwiftUI

//@Observable
class HostViewModel: ObservableObject{
    
    var hosts = [
        Host(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 5),
        Host(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 4),
        Host(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 3),
        Host(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 2),
        Host(profile: Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("maryam")),
             description: "I'm invincible", location: "Pozzouli 354", spot: 2)
    ]
    
    func add(_ host: Host) {
        hosts.insert(host, at: 0)
    }
}

