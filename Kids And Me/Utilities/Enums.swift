//
//  Enums.swift
//  Kids And Me
//
//  Created by BusranurOK on 24.10.2022.
//

import SwiftUI

enum CreatureType: String, Equatable, CaseIterable {
    
    case choose = "Seçiniz"
    case baybie = "Bebek"
    case mom = "Anne"
    case animal = "Hayvan"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    
}

enum Gender: String, Equatable, CaseIterable {
    
    case choose = "Seçiniz"
    case male = "Bay"
    case female = "Bayan"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    
}

enum FoodType: String {
    
    case breastMilk = "Anne sütü"
    case cowmilk = "İnek sütü"
    case babyFood = "Bebek maması"
    case solidFood = "Katı mama"
    case liquidFood = "Sıvı Mama"
    
}

enum ConsumptionType: String {
    
    case bottle = "Biberon"
    case milking = "Sağma"
    case breastFeeding = "Emzirme"
    
}

enum FoodSupply: String {
    
    case rightChest = "Sağ göğüs"
    case leftChest = "Sol göğüs"
    
}
