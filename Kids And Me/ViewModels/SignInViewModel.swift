//
//  SignInViewModel.swift
//  Kids And Me
//
//  Created by BusranurOK on 1.11.2022.
//

import SwiftUI

class SignInViewModel: ObservableObject {
   
    // MARK: Login Properties..
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // MARK: Sign Up Properties..
    @Published var signUpUser: Bool = false
    @Published var signUp_Enter_Password: String = ""
    @Published var showSignUpEnterPassword: Bool = false
    @Published var birthDate = Date()
    
    // Sign In Call...
    func SignIn() {
        
        // Do Action Here
        
    }
    
    func SignUp() {
        
        // Do Action Here
        
    }
    
    func ForgotPassword() {
        
        // Do Action Here
        
    }
    
}
