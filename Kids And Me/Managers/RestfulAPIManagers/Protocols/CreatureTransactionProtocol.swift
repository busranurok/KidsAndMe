//
//  CreatureTransactions.swift
//  Kids And Me
//
//  Created by BusranurOK on 25.10.2022.
//

import SwiftUI

protocol CreatureTransactionProtocol {
    
    func feed(foodAttempt : FoodAttemptDto) -> Void
    
    func addSleepAttempt(sleepAttempt : SleepAttemptDto) -> Void
    
}
