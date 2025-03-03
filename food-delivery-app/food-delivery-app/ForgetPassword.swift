//
//  ForgetPassword.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 03/03/25.
//
import SwiftUI

struct ForgetPassword : View{
    @State private var emailText: String = ""
    @State private var isNavigating: Bool = false
    
    var body: some View {
        
        ZStack {
            Color(UIColor(red: 18/255, green: 18/255, blue: 35/255, alpha: 1))
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack(alignment: .center){
                    Spacer().frame(height: geometry.size.height*0.120)
                    Text("Forget Password")
                        .font(.custom("Roboto-Bold", size: 40))
                        .foregroundColor(.white)
                    Spacer().frame(height: geometry.size.height*0.032)
                    Text("Please sign in to your existing account")
                        .font(.custom("Roboto-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    Spacer().frame(height: geometry.size.height*0.08)
                    ZStack(alignment: .topLeading){
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: geometry.size.height)
                            .frame(maxWidth: geometry.size.width)
                            .background(Color.white) // Optional background color
                            .clipShape(RoundedCornerShape(radius: 16, corners: [.topLeft, .topRight]))  .overlay(
                                RoundedCornerShape(radius: 16, corners: [.topLeft, .topRight])
                                    .stroke(Color.white) // Border color and width
                            )
                            .ignoresSafeArea(.all, edges: .horizontal)
                        VStack(alignment: .leading){
                            Spacer().frame(height: geometry.size.height*0.020)
                            Text("Email")
                                .foregroundColor(Color(UIColor(red: 50/255, green: 52/255, blue: 62/255, alpha: 1)))
                                .font(.custom("Roboto-Regular", size: 16)).fontWeight(.medium)
                                .padding(.horizontal,16)
                            Spacer().frame(height: geometry.size.height*0.04)
                            RoundedTextField(text: $emailText)
                            Spacer().frame(height: geometry.size.height*0.04)
                            Button(action: {
                                if emailText.isEmpty{
                                    print("email is empty")
                                }else{
                                    isNavigating = true
                                }
                                
                            }) {
                                Text("SEND CODE")
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
                            }.frame(height:geometry.size.height*0.062)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            
                            NavigationLink(destination: VerificationScreen(email: $emailText), isActive: $isNavigating) {
                                EmptyView()
                            }
                            .hidden()
                        }
                    }
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
