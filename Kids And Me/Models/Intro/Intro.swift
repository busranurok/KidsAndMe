//
//  Intro.swift
//  Kids And Me
//
//  Created by BusranurOK on 31.10.2022.
//

import SwiftUI

// MARK: Intro Model and Sample Intro's
struct Intro: Identifiable {
    
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var text: String
    
}

var intros: [Intro] = [
    
    .init(imageName: "Mother and baby", title: "Çocuğunuzun Bakımı", text: "Evladınızın çiş miktarı ya da kaka rengi, kokusu ve miktarına göre herhangi bir hastalığının olup olmadığının kontrolünü yapabilirsiniz."),
    .init(imageName: "Mother and Baby1", title: "Çocuk Sevgisi", text: "Artık gönül rahatlığıyla çocuğunuz ile güvenli bağlanabileceksiniz."),
    .init(imageName: "Mother and baby", title: "Çocuğunuz ve Siz", text: "Çocuğunuzu beslerken hangi göğüste kalmıştım, ne kadar süre yedi gibi şeyler düşünmek yerine onunla daha fazla göz teması kurabileceksiniz.")
    
]

// MARK: Font String' s
let sansBold = "WorkSans-Bold"
let sansSemiBold = "WorkSans-SemiBold"
let sansRegular = "WorkSans-Regular"

// MAR: Dummy Text
let dummyText = "Artık gönül rahatlığıyla çocuğunuz ile güvenli bağlanabileceksiniz."


