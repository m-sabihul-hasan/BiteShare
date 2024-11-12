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
        Host(name: "Muhammad Sabihul", surname: "Hasan", description: "Let's Party", spot: 5, profileImage: Image("boy")),
        Host(name: "Filippo", surname: "Caliendo", description: "I'm strong", spot: 4, profileImage: Image("boy")),
        Host(name: "Maria", surname: "Petrillo", description: "I'm strong", spot: 3, profileImage: Image("girl")),
        Host(name: "Sakshi", surname: "Anil", description: "I'm strong", spot: 2, profileImage: Image("girl")),
        Host(name: "Maryam", surname: "IDK", description: "I'm invincible", spot: 2, profileImage: Image("girl"))
    ]
    
    func add(_ host: Host) {
        hosts.insert(host, at: 0)
    }
}

