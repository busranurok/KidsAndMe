//
//  Creature.swift
//  Kids And Me
//
//  Created by BusranurOK on 24.10.2022.
//

import SwiftUI

class CreatureDto: Identifiable {
    
    var id: UUID?
    var name: String?
    var birthdate: Date?
    var gender: Gender?
    
    init() {}
    
    init(id: UUID, name: String, birtdate: Date, gender: Gender) {
        
        self.id = id
        self.name = name
        self.birthdate = birtdate
        self.gender = gender
        
    }
    
    // Override
    func welcomeLetter() -> String {
        
        guard let name = self.name else {
            
            return "Hoş geldin"
            
        }
        
        return "Hoş geldin \(name)"
        
    }
    
    
}
