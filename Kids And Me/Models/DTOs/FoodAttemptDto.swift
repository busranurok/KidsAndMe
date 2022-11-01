//
//  FoodTransactions.swift
//  Kids And Me
//
//  Created by BusranurOK on 25.10.2022.
//

import SwiftUI

class FoodAttemptDto {
    
    var foodType: FoodType?
    var consumptionType: ConsumptionType?
    var quantity: Double?
    var date: Date?
    var eatingDuration: Double?
    var foodSupply: FoodSupply?
    var childReaction: Image?
    
    init(foodType: FoodType, consumptionType: ConsumptionType, quantity: Double, date: Date, eatingDuration: Double, foodSupply: FoodSupply, childReaction: Image) {
        self.foodType = foodType
        self.consumptionType = consumptionType
        self.quantity = quantity
        self.date = date
        self.eatingDuration = eatingDuration
        self.foodSupply = foodSupply
        self.childReaction = childReaction
    }
    
}
