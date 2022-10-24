//
//  AnimalDto.swift
//  Kids And Me
//
//  Created by BusranurOK on 25.10.2022.
//

import SwiftUI

class AnimalDto: CreatureDto {
    
    override init(id: UUID, name: String, birtdate: Date, gender: Gender) {
        
        super.init(id: id, name: name, birtdate: birtdate, gender: gender)
        
    }
    
    override func welcomeLetter() -> String {
        
        guard let name = self.name else {
            
            return "Hoş geldiniz"
            
        }
        
        return "Hoşgeldin \(name)"
        
    }
    
}
