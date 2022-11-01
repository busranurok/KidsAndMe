//
//  IntroView.swift
//  Kids And Me
//
//  Created by BusranurOK on 31.10.2022.
//

import SwiftUI

struct IntroView: View {
    
    // MARK: Animation Properties
    @State private var showWalkThroughScreens: Bool = false
    @State private var currentIndex: Int = 0
    @State private var showSignInView: Bool = false
    var signInViewModel : SignInViewModel = SignInViewModel()
    
    var body: some View {
        
        ZStack {
            
            if showSignInView {
                
                SignInView(signInData: signInViewModel)
                    .transition(.move(edge: .bottom))
                
            }else {
                
                ZStack {
                    
                    Color(.white)
                        .ignoresSafeArea()
                    
                    IntroScreen()
                    
                    Navbar()
                    
                    WalkThroughScreens()
                    
                }
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
                
            }
            
        }
        .animation(.easeInOut(duration: 0.35), value: showSignInView)
        
    }
    
    // MARK: WalkThrough Screens
    @ViewBuilder
    func WalkThroughScreens() -> some View {
        
        let isLast = currentIndex == intros.count
        
        GeometryReader { geometry in
            
            let size = geometry.size
            
            ZStack{
                
                // MARK: Walk Through Screens
                ForEach(intros.indices, id: \.self) { index in
                    
                    ScreenView(size: size, index: index)
                    
                }
                
                WelcomeView(size: size, index: intros.count)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // MARK: Next Button
            .overlay(alignment: .bottom) {
                
                // MARK: Converting Next Button Into Signup Button
                ZStack {
                    
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .scaleEffect(!isLast ? 1 : 0.001)
                        .opacity(!isLast ? 1 : 0)
                    
                    HStack {
                        
                        Text("Kayıt Ol")
                            .font(.custom(sansBold, size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 15)
                    .scaleEffect(isLast ? 1 : 0.001)
                    .frame(height: isLast ? nil : 0)
                    .opacity(isLast ? 1 : 0)
                    
                }
                .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
                .foregroundColor(.white)
                .background {
                    
                    RoundedRectangle(cornerRadius: 30, style: .circular)
                        .fill(.blue)
                    
                }
                .onTapGesture {
                    
                    if currentIndex == intros.count {
                        
                        // Sign Up Action
                        showSignInView = true
                        signInViewModel.signUpUser = true
                        
                        
                    }else {
                        
                        // MARK: UPdating currentIndex
                        currentIndex += 1
                        
                    }
                    
                }
                .offset(y: -90)
                
            }
            .overlay(alignment: .bottom, content: {
                
                // MARK: Button Sign In Button
                let isLast = currentIndex == intros.count
                
                HStack(spacing: 5) {
                    
                    Text("Zaten hesabınız var mı?")
                        .font(.custom(sansRegular, size: 14))
                        .foregroundColor(.gray)
                    
                    Button("Giriş Yap") {
                        
                        showSignInView = true
                        signInViewModel.signUpUser = false
                        
                    }
                    .font(.custom(sansBold, size: 14))
                    .foregroundColor(.blue)
                    
                }
                .offset(y: isLast ? -50 : 100)
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
                
            })
            .offset(y: showWalkThroughScreens ? 0 : size.height)
            
        }
        
    }
    
    @ViewBuilder
    func ScreenView(size: CGSize, index: Int) -> some View {
        
        let intro = intros[index]
        
        VStack(spacing: 10) {
            
            Text(intro.title)
                .font(.custom(sansBold, size: 28))
            // MARK: Applying Offset For Each Screen' s
                .offset(x: -size.width * CGFloat(currentIndex - index))
            // MARK: Adding animation
            // MARK: Adding Delay to Elements based On ındex
            // My Delay Starts From Top
            // You can also modify code to start delay from Bottom
            // delay :
            // 0.2, 0.1, 0
            // Adding Extra 0.2 For Current Index
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text(intro.text)
                .font(.custom(sansRegular, size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2), value: currentIndex)
            
        }
        
    }
    
    @ViewBuilder
    func WelcomeView(size: CGSize, index: Int) -> some View {
        
        VStack(spacing: 10) {
            
            Image("Mother and Baby1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0), value: currentIndex == index ? 0.1 : 0)
            
            Text("Hoş geldin X bebek")
                .font(.custom(sansBold, size: 28))
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
                
            
            Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
                .font(.custom(sansRegular, size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
        }
        .offset(y: -30)
        
    }
    
    // MARK: Nav Bar
    @ViewBuilder
    func Navbar() -> some View {
        
        let isLast = currentIndex == intros.count
        
        HStack {
            
            Button {
                
                // If Greater Than Zero Then Eliminating Index
                if currentIndex > 0 {
                    
                    currentIndex -= 1
                    
                }else {
                    
                    showWalkThroughScreens.toggle()
                    
                }
                
            } label: {
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                
            }
            
            Spacer()
            
            Button("Geç") {
                
                currentIndex = intros.count
                
            }
            .font(.custom(sansRegular, size: 15))
            .foregroundColor(.blue)
            .opacity(isLast ? 0 : 1)
            .animation(.easeInOut, value: isLast)
            
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
        
    }
    
    @ViewBuilder
    func IntroScreen() -> some View {
        
        GeometryReader { geometry in
            
            let size = geometry.size
            
            VStack(spacing: 10) {
                
                Image("Mother and Baby1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(200)
                    .frame(width: geometry.size.width, height: geometry.size.height / 2)
                
                Text("Anneler ve aşkları")
                    .font(.custom(sansSemiBold, size: 27))
                    .padding(.top, 55)
                
                Text(dummyText)
                    .font(.custom(sansRegular, size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Text("Haydi Başla")
                    .font(.custom(sansSemiBold, size: 14))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
                    .background {
                        
                        Capsule()
                            .fill(.blue)
                        
                    }
                    .onTapGesture {
                        
                        showWalkThroughScreens.toggle()
                        
                    }
                    .padding(.top, 30)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            // MARK: Moving Up When Clicked
            .offset(y: showWalkThroughScreens ? -size.height: 0)
            
        }
        .ignoresSafeArea()
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
        ContentView()
            .previewDevice("iPhone 8")
    }
}

// MARK: Home View
struct Home: View {
    
    var body: some View {
        
        NavigationStack {
            
            Text("")
                .navigationTitle("Home")
            
        }
        
    }
    
}

// Extending View to get Screen Bounds...
extension View {
    
    func getRect() -> CGRect {
        
        return UIScreen.main.bounds
        
    }
    
}
