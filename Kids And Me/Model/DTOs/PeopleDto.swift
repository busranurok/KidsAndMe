//
//  PeopleDto.swift
//  Kids And Me
//
//  Created by BusranurOK on 24.10.2022.
//

import SwiftUI

class PeopleDto: CreatureDto {
    
    override func welcomeLetter() -> String {
        
        return super.welcomeLetter()
        
    }
    
    // init() {} anlama gelir. Boş.
    override init(id: UUID, name: String, birtdate: Date, gender: Gender) {
        
        super.init(id: id, name: name, birtdate: birtdate, gender: gender)
        
    }
    
}
