//
//  SignUpScreen.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 06/03/25.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var emailText: String = ""
    @State private var password: String = ""
    @State private var nameText: String = ""
    @State private var isNavigating: Bool = false

    @State private var errorMessage: String = ""
    @State private var iconImage: String = ""
    @State private var navRouteName: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color(
                    UIColor(
                        red: 18 / 255, green: 18 / 255, blue: 35 / 255, alpha: 1
                    )
                )
                .ignoresSafeArea()

                GeometryReader { geometry in
                    VStack(alignment: .center) {
                        Spacer().frame(height: geometry.size.height * 0.060)
                        Text("Sign Up")
                            .font(.custom("Roboto-Bold", size: 40))
                            .foregroundColor(.white)
                        Spacer().frame(height: geometry.size.height * 0.022)
                        Text("Please sign up to get started")
                            .font(.custom("Roboto-Regular", size: 16))
                            .foregroundColor(.white)

                        Spacer().frame(height: geometry.size.height * 0.06)
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: geometry.size.height)
                                .frame(maxWidth: geometry.size.width)
                                .background(Color.white)
                                .clipShape(
                                    RoundedCornerShape(
                                        radius: 16,
                                        corners: [.topLeft, .topRight])
                                ).overlay(
                                    RoundedCornerShape(
                                        radius: 16,
                                        corners: [.topLeft, .topRight]
                                    )
                                    .stroke(
                                        Color.white
                                    )  // Border color and width
                                )
                                .ignoresSafeArea(.all, edges: .horizontal)
                            VStack(alignment: .leading) {
                                Spacer().frame(
                                    height: geometry.size.height * 0.012)
                                Text("Name")
                                    .foregroundColor(
                                        Color(
                                            UIColor(
                                                red: 50 / 255, green: 52 / 255,
                                                blue: 62 / 255, alpha: 1))
                                    )
                                    .font(.custom("Roboto-Regular", size: 16))
                                    .fontWeight(.medium)
                                    .padding(.horizontal, 16)
                                Spacer().frame(
                                    height: geometry.size.height * 0.012)
                                RoundedNameTextField(text: $nameText)
                                Spacer().frame(
                                    height: geometry.size.height * 0.012)
                                Text("Email")
                                    .foregroundColor(
                                        Color(
                                            UIColor(
                                                red: 50 / 255, green: 52 / 255,
                                                blue: 62 / 255, alpha: 1))
                                    )
                                    .font(.custom("Roboto-Regular", size: 16))
                                    .fontWeight(.medium)
                                    .padding(.horizontal, 16)
                                Spacer().frame(
                                    height: geometry.size.height * 0.012)
                                RoundedTextField(text: $emailText)
                                Spacer().frame(
                                    height: geometry.size.height * 0.012)
                                Text("PASSWORD")
                                    .foregroundColor(
                                        Color(
                                            UIColor(
                                                red: 50 / 255, green: 52 / 255,
                                                blue: 62 / 255, alpha: 1))
                                    )
                                    .font(.custom("Roboto-Regular", size: 16))
                                    .fontWeight(.medium)
                                    .padding(.horizontal, 16)
                                Spacer().frame(
                                    height: geometry.size.height * 0.012)
                                PasswordTextField(password: $password)
                                Spacer().frame(
                                    height: geometry.size.height * 0.042)
//                                Text("RE-TYPE PASSWORD")
//                                    .foregroundColor(
//                                        Color(
//                                            UIColor(
//                                                red: 50 / 255, green: 52 / 255,
//                                                blue: 62 / 255, alpha: 1))
//                                    )
//                                    .font(.custom("Roboto-Regular", size: 16))
//                                    .fontWeight(.medium)
//                                    .padding(.horizontal, 16)
//                                Spacer().frame(
//                                    height: geometry.size.height * 0.012)
//                                RetypePasswordTextField(password: $reTypePassword)
//                                Spacer().frame(
//                                    height: geometry.size.height * 0.040)
                                Button(action: {
                                    if nameText.isEmpty {
                                        print("User full name is empty")
                                        errorMessage =
                                        "Please enter full name"
                                        iconImage = "xmark.circle.fill"
                                        ToastManager.shared.showToastMessage(
                                            message: errorMessage,
                                            icon: iconImage)
                                    } else if emailText.isEmpty {
                                        print("email is empty")
                                        errorMessage =
                                        "Please enter e-mail address"
                                        iconImage = "xmark.circle.fill"
                                        ToastManager.shared.showToastMessage(
                                            message: errorMessage,
                                            icon: iconImage)
                                    } else if password.isEmpty {
                                        print("password is empty")
                                        errorMessage =
                                        "Please enter password"
                                        iconImage = "xmark.circle.fill"
                                        ToastManager.shared.showToastMessage(
                                            message: errorMessage,
                                            icon: iconImage)
                                    } else {
                                        navRouteName = "location-access"
                                        isNavigating = true
                                    }
                                }) {
                                    Text("SIGN UP")
                                        .font(
                                            .custom("Roboto-Regular", size: 16)
                                        ).fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .frame().frame(height: 62)
                                        .background(
                                            Color(
                                                UIColor(
                                                    red: 255 / 255,
                                                    green: 118 / 255,
                                                    blue: 34 / 255, alpha: 1))
                                        )
                                        .cornerRadius(12)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(
                                                    Color.white, lineWidth: 2)  // White border
                                        )
                                }.frame(height: geometry.size.height * 0.062)
                                    .padding(.horizontal, 16)
                                Spacer().frame(
                                    height: geometry.size.height * 0.03)
                                HStack {
                                    Text("Don’t have an account?")
                                        .foregroundColor(
                                            Color(
                                                UIColor(
                                                    red: 100 / 255,
                                                    green: 105 / 255,
                                                    blue: 130 / 255, alpha: 1))
                                        )
                                        .font(
                                            .custom("Roboto-Regular", size: 18)
                                        ).fontWeight(.medium)
                                    Spacer().frame(width: 20)
                                    Text("SIGN UP")
                                        .foregroundColor(
                                            Color(
                                                UIColor(
                                                    red: 255 / 255,
                                                    green: 118 / 255,
                                                    blue: 34 / 255, alpha: 1))
                                        )
                                        .font(
                                            .custom("Roboto-Regular", size: 18)
                                        ).fontWeight(.bold)
                                        .onTapGesture {
                                            print("New user creation tapped")
                                        }

                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                                Spacer().frame(
                                    height: geometry.size.height * 0.01)
                                NavigationLink(
                                    destination: destinationView,
                                    isActive: $isNavigating
                                ) {
                                    EmptyView()
                                }.frame(height: geometry.size.height * 0.005)
                            }
                        }

                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)

        }.overlay(
            VStack {
                Spacer()
                ToastView()
            })

    }
    
    @ViewBuilder
    private var destinationView: some View {
        if navRouteName == "location-access" {
            LocationAccess(isFrom: true)
        } else {
            VerificationScreen(email: $emailText)
        }
    }

}
