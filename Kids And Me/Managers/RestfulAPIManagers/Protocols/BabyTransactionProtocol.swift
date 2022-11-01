//
//  BabyTransaction.swift
//  Kids And Me
//
//  Created by BusranurOK on 25.10.2022.
//

import SwiftUI

protocol BabyTransactionProtocol: CreatureTransactionProtocol {
    
    func addUsingDiaper(diaper : UsingDiaperDto) -> Void
    
    func addBathroomAttempt(bathroom : BathroomAttemptDto) -> Void
    
    func addSleepReminder(sleepReminder: SleepReminderDto) -> Void
    
    
}
