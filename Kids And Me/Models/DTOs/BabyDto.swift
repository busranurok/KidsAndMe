//
//  Baby.swift
//  Kids And Me
//
//  Created by BusranurOK on 25.10.2022.
//

import SwiftUI

class BabyDto: PeopleDto {
    
    override func welcomeLetter() -> String {
        
        guard let name = name else {
            
            return super.welcomeLetter()
            
        }
        
        return "Hoş geldin \(name) bebek :)"
        
    }
    
}
