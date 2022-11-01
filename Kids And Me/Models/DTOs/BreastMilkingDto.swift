//
//  BreastMilkingDto.swift
//  Kids And Me
//
//  Created by BusranurOK on 25.10.2022.
//

import SwiftUI

class BreastMilkingDto {

    var date: Date?
    var chest: FoodSupply?
    var quantity: Double?
    var duration: Double?
    
    init(date: Date, chest: FoodSupply, quantity: Double, duration: Double) {
        self.date = date
        self.chest = chest
        self.quantity = quantity
        self.duration = duration
    }
    
}
