//
//  LoginScreen.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 28/02/25.
//

import SwiftUI

struct LoginScreen : View {
    @State private var emailText: String = ""
    @State private var isNavigating: Bool = false
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(UIColor(red: 18/255, green: 18/255, blue: 35/255, alpha: 1))
                    .ignoresSafeArea()
                
                GeometryReader { geometry in
                    VStack(alignment: .center){
                        Spacer().frame(height: 120)
                        Text("Log In")
                            .font(.custom("Roboto-Bold", size: 40))
                            .foregroundColor(.white)
                        Spacer().frame(height: 12)
                        Text("Please sign in to your existing account")
                            .font(.custom("Roboto-Regular", size: 16))
                            .foregroundColor(.white)
                        
                        Spacer().frame(height: 80)
                        ZStack(alignment: .topLeading){
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: geometry.size.height)
                                .frame(maxWidth: geometry.size.width)
                                .background(Color.white)
                                .clipShape(RoundedCornerShape(radius: 16, corners: [.topLeft, .topRight]))  .overlay(
                                    RoundedCornerShape(radius: 16, corners: [.topLeft, .topRight])
                                        .stroke(Color.white) // Border color and width
                                )
                                .ignoresSafeArea(.all, edges: .horizontal)
                            VStack(alignment: .leading){
                                Spacer().frame(height: 20)
                                Text("Email")
                                    .foregroundColor(Color(UIColor(red: 50/255, green: 52/255, blue: 62/255, alpha: 1)))
                                    .font(.custom("Roboto-Regular", size: 16)).fontWeight(.medium)
                                    .padding(.horizontal,16)
                                Spacer().frame(height: 20)
                                RoundedTextField(text: $emailText)
                                Spacer().frame(height: 20)
                                Text("Password")
                                    .foregroundColor(Color(UIColor(red: 50/255, green: 52/255, blue: 62/255, alpha: 1)))
                                    .font(.custom("Roboto-Regular", size: 16)).fontWeight(.medium)
                                    .padding(.horizontal,16)
                                Spacer().frame(height: 20)
                                PasswordTextField()
                                Spacer().frame(height: 20)
                                
                                NavigationLink(destination: ForgetPassword()){
                                    Text("Forget Password")
                                        .foregroundColor(Color(UIColor(red: 255/255, green: 118/255, blue: 34/255, alpha: 1)))
                                        .font(.custom("Roboto-Regular", size: 16)).fontWeight(.medium)
                                    
                                }
                                .padding(.horizontal,16)
                                Spacer().frame(height: 40)
                                Button(action: {
                                    print("LOGIN Button Clicked")
                                    if emailText.isEmpty{
                                        print("email is empty")
                                        
                                    }else{
                                        isNavigating = true
                                    }
                                }) {
                                    Text("LOG IN")
                                        .font(.custom("Roboto-Regular", size: 16)).fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color(UIColor(red: 255/255, green: 118/255, blue: 34/255, alpha: 1)))
                                        .cornerRadius(12)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white, lineWidth: 2) // White border
                                        )
                                }.frame(height:58)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                Spacer().frame(height: 20)
                                NavigationLink(destination: VerificationScreen(email: $emailText), isActive: $isNavigating) {
                                    EmptyView()
                                }
                                HStack{
                                    Text("Don’t have an account?")
                                        .foregroundColor(Color(UIColor(red: 100/255, green: 105/255, blue: 130/255, alpha: 1)))
                                        .font(.custom("Roboto-Regular", size: 18)).fontWeight(.medium)
                                    
                                    Spacer().frame(width: 20)
                                    Text("SIGN UP")
                                        .foregroundColor(Color(UIColor(red: 255/255, green: 118/255, blue: 34/255, alpha: 1)))
                                        .font(.custom("Roboto-Regular", size: 18)).fontWeight(.bold)
                                        .onTapGesture {
                                            print("New user creation tapped");
                                        }
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
    }
    
    
}
