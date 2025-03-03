//
//  VerificationScreen.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 03/03/25.
//

import SwiftUI

struct VerificationScreen : View{
    @Binding var email: String
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 18/255, green: 18/255, blue: 35/255, alpha: 1))
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack(alignment: .center){
                    Spacer().frame(height: 120)
                    Text("Verification")
                        .font(.custom("Roboto-Bold", size: 40))
                        .foregroundColor(.white)
                    Spacer().frame(height: 12)
                    Text("We have sent code to your email")
                        .font(.custom("Roboto-Regular", size: 16))
                        .foregroundColor(.white)
                    Spacer().frame(height: 12)
                    Text("\(email)")
                        .font(.custom("Roboto-Bold", size: 16))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Spacer().frame(height: 80)
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
                            Spacer().frame(height: 20)
                            Text("Email")
                                .foregroundColor(Color(UIColor(red: 50/255, green: 52/255, blue: 62/255, alpha: 1)))
                                .font(.custom("Roboto-Regular", size: 16)).fontWeight(.medium)
                                .padding(.horizontal,16)
                            Spacer().frame(height: 20)
//                            RoundedTextField(email: $emailText)
                            Spacer().frame(height: 40)
                            Button(action: {
                                print("LOGIN Button Clicked")
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
                            }.frame(height:58)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                        }
                    }
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
