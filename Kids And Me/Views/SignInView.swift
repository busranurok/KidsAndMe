//
//  SignInView.swift
//  Kids And Me
//
//  Created by BusranurOK on 1.11.2022.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var signInData: SignInViewModel = SignInViewModel()
    @State private var buttonText: String = ""
    @State private var isExpandedForCreatureType: Bool = false
    @State private var isExpandedForGender: Bool = false
    @State private var selectedCreatureType: CreatureType = .choose
    @State private var selectedGender: Gender = .choose
    
    var body: some View {
        
        VStack {
            
            // Welcome Back text for 3 half of the screen
            Text("Kids And Me")
                .font(.custom(sansRegular, size: 40)).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                    
                    ZStack {
                        
                        // Gradient Circle...
                        LinearGradient(colors: [
                            
                            Color(.white),
                            Color(.white)
                                .opacity(0.8),
                            Color(.blue)
                            
                        ], startPoint: .top, endPoint: .bottom)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(.trailing)
                        .offset(y: -25)
                        .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 30)
                        
                    }
                    
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                // Sign In Page Form...
                VStack(spacing: 15) {
                    
                    Text(signInData.signUpUser ? "Kayıt" : "Giriş")
                        .font(.custom(sansRegular, size: 22)).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Sign Up Renter Type
                    if signInData.signUpUser {
                        
                        CustomDisclosureGroupForCreatureType(icon: "questionmark.circle", title: "Canlı Tipi")
                            .padding(.top, 30)
                        
                        // Custom TextField...
                        CustomTextField(icon: "person.text.rectangle", title: "İsim", hint: "Büşra Nur", value: $signInData.email, showPassword: .constant(false))
                            .padding(.top, 10)
                        
                        CustomDisclosureGroupForGenderType(icon: "person.crop.circle", title: "Cinsiyet")
                            .padding(.top, 10)
                        
                        CustomDatePicker(icon: "calendar.circle", title: "Doğum Tarihi")
                            .padding(.top, 10)
                        
                        
                        
                    }
                    
                    // Custom TextField...
                    CustomTextField(icon: "envelope", title: "E-posta", hint: "busranurok@gmail.com", value: $signInData.email, showPassword: .constant(false))
                        .padding(.top, 10)
                    
                    CustomTextField(icon: "lock", title: "Şifre", hint: "123456", value: $signInData.password, showPassword: $signInData.showPassword)
                        .padding(.top, 10)
                    
                    // Sign Up Renter Password
                    if signInData.signUpUser {
                        
                        CustomTextField(icon: "lock", title: "Şifre Tekrar", hint: "123456", value: $signInData.signUp_Enter_Password, showPassword: $signInData.showSignUpEnterPassword)
                            .padding(.top, 10)
                        
                    }
                    
                    
                    // Forgot Password Button...
                    Button {
                        
                        signInData.ForgotPassword()
                        
                    } label: {
                        
                        Text("Şifremi Unuttum?")
                            .font(.custom(sansSemiBold, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Login Button...
                    Button {
                        
                        if signInData.signUpUser {
                            
                            signInData.SignUp()
                            
                        }else {
                            
                            signInData.SignIn()
                            
                        }
                        
                    } label: {
                        
                        Text(buttonText)
                            .font(.custom(sansSemiBold, size: 17))
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.07), radius: 5, x:5, y: 5)
                        
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onAppear() {
                        
                        if signInData.signUpUser {
                            
                            buttonText = "Kayıt Ol"
                            
                        }else {
                            
                            buttonText = "Giriş Yap"
                            
                        }
                        
                    }
                    
                }
                .padding(25)
                .padding(.horizontal)
                
                // Sign Up User Button...
                Button {
                    
                    withAnimation {
                        
                        signInData.signUpUser.toggle()
                        
                        if signInData.signUpUser {
                            
                            buttonText = "Kayıt Ol"
                            
                        }else {
                            
                            buttonText = "Giriş Yap"
                            
                        }
                        
                    }
                    
                } label: {
                    
                    Text(signInData.signUpUser ? "Giriş' e geri dön" : "Hesap Oluştur")
                        .font(.custom(sansSemiBold, size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                }
                .padding(.top, 8)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                
                Color.white
                //Applying custom Corners...
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        
        // Clearing data when Changes...
        // Optional...
        .onChange(of: signInData.signUpUser) { newValue in
            
            signInData.email = ""
            signInData.password = ""
            signInData.signUp_Enter_Password = ""
            signInData.showPassword = false
            signInData.showSignUpEnterPassword = false
            
        }
        
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Label {
                
                Text(title)
                    .font(.custom(sansRegular, size: 14))
                
            } icon: {
                
                Image(systemName: icon)
                
            }
            .foregroundColor(.black.opacity(0.8))
            
            if title.contains("Şifre") && !showPassword.wrappedValue {
                
                SecureField(hint, text: value)
                    .padding(.top, 2)
                
            }else {
                
                TextField(hint, text: value)
                    .padding(.top, 2)
                
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
            
        }
        
        // Showing Show for password Field...
        .overlay (
            
            Group {
                
                if title.contains("Şifre") {
                    
                    Button(action: {
                        
                        showPassword.wrappedValue.toggle()
                        
                    }, label: {
                        
                        Text(showPassword.wrappedValue ? "Gizle" : "Göster")
                            .font(.custom(sansSemiBold, size: 13))
                            .foregroundColor(.blue)
                        
                    })
                    .offset(y: 10)
                    
                }
                
            }
            
            ,alignment : .trailing
            
            
        )
        
    }
    
    @ViewBuilder
    func CustomDisclosureGroupForCreatureType(icon: String, title: String) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Label {
                
                Text(title)
                    .font(.custom(sansRegular, size: 14))
                
            } icon: {
                
                Image(systemName: icon)
                
            }
            .foregroundColor(.black.opacity(0.8))
            
            DisclosureGroup("\(selectedCreatureType.rawValue)", isExpanded: $isExpandedForCreatureType) {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        ForEach(CreatureType.allCases, id: \.self) { value in
                            
                            Text(value.localizedName)
                                .font(.custom(sansSemiBold, size: 13))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .onTapGesture {
                                    
                                    self.selectedCreatureType = value
                                    
                                    withAnimation {
                                        
                                        self.isExpandedForCreatureType.toggle()
                                        
                                    }
                                    
                                }
                            
                        }
                        
                    }
                    
                }
                .frame(height: 150)
                
            }
            .accentColor(.blue).bold()
            .font(.custom(sansBold, size: 10))
            .foregroundColor(.black)
            .padding()
            .background {
                
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(.blue).opacity(0.1)
                
            }
            
        }
        
    }
    
    @ViewBuilder
    func CustomDisclosureGroupForGenderType(icon: String, title: String) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Label {
                
                Text(title)
                    .font(.custom(sansRegular, size: 14))
                
            } icon: {
                
                Image(systemName: icon)
                
            }
            .foregroundColor(.black.opacity(0.8))
            
            DisclosureGroup("\(selectedGender.rawValue)", isExpanded: $isExpandedForGender) {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        ForEach(Gender.allCases, id: \.self) { value in
                            
                            Text(value.localizedName)
                                .font(.custom(sansSemiBold, size: 13))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .onTapGesture {
                                    
                                    self.selectedGender = value
                                    
                                    withAnimation {
                                        
                                        self.isExpandedForGender.toggle()
                                        
                                    }
                                    
                                }
                            
                        }
                        
                    }
                    
                }
                .frame(height: 150)
                
            }
            .accentColor(.blue).bold()
            .font(.custom(sansBold, size: 10))
            .foregroundColor(.black)
            .padding()
            .background {
                
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(.blue).opacity(0.1)
                
            }
            
        }
        
    }
    
    @ViewBuilder
    func CustomDatePicker(icon: String, title: String) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Label {
                
                Text(title)
                    .font(.custom(sansRegular, size: 14))
                
            } icon: {
                
                Image(systemName: icon)
                
            }
            .foregroundColor(.black.opacity(0.8))
            
            DatePicker("", selection: $signInData.birthDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .labelsHidden()
            .accentColor(.blue).bold()
            .font(.custom(sansBold, size: 10))
            .background {
                
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(.blue).opacity(0.1)
                
            }
            
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .previewDevice("iPhone 12")
        
        SignInView()
            .previewDevice("iPhone 8")
    }
}
