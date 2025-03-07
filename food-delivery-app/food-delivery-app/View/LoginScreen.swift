//
//  LoginScreen.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 28/02/25.
//

import SwiftUI

struct LoginScreen: View {
    @State private var emailText: String = ""
    @State private var password: String = ""
    @State private var isNavigating: Bool = false
    @State private var isNavigatingSignUP: Bool = false

    @State private var errorMessage: String = ""
    @State private var iconImage: String = ""

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
                        Spacer().frame(height: geometry.size.height * 0.120)
                        Text("Log In")
                            .font(.custom("Roboto-Bold", size: 40))
                            .foregroundColor(.white)
                        Spacer().frame(height: geometry.size.height * 0.032)
                        Text("Please sign in to your existing account")
                            .font(.custom("Roboto-Regular", size: 16))
                            .foregroundColor(.white)

                        Spacer().frame(height: geometry.size.height * 0.08)
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
                                    .stroke(Color.white)  // Border color and width
                                )
                                .ignoresSafeArea(.all, edges: .horizontal)
                            VStack(alignment: .leading) {
                                Spacer().frame(
                                    height: geometry.size.height * 0.020)
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
                                    height: geometry.size.height * 0.020)
                                RoundedTextField(text: $emailText)
                                Spacer().frame(
                                    height: geometry.size.height * 0.020)
                                Text("Password")
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
                                    height: geometry.size.height * 0.020)
                                PasswordTextField(password: $password)
                                Spacer().frame(
                                    height: geometry.size.height * 0.020)

                                NavigationLink(destination: ForgetPassword()) {
                                    Text("Forget Password")
                                        .foregroundColor(
                                            Color(
                                                UIColor(
                                                    red: 255 / 255,
                                                    green: 118 / 255,
                                                    blue: 34 / 255, alpha: 1))
                                        )
                                        .font(
                                            .custom("Roboto-Regular", size: 16)
                                        ).fontWeight(.medium)

                                }
                                .padding(.horizontal, 16)
                                Spacer().frame(
                                    height: geometry.size.height * 0.04)
                                Button(action: {
                                    print("LOGIN Button Clicked")
                                    if emailText.isEmpty {
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
                                        isNavigating = true
                                    }
                                }) {
                                    Text("LOG IN")
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
                                    .padding(.vertical, 12)
                                Spacer().frame(
                                    height: geometry.size.height * 0.02)
                                NavigationLink(
                                    destination: VerificationScreen(
                                        email: $emailText),
                                    isActive: $isNavigating
                                ) {
                                    EmptyView()
                                }.frame(height: geometry.size.height * 0.010)
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
                                    NavigationLink(destination: SignUpScreen())
                                    {
                                        Text("SIGN UP")
                                            .foregroundColor(
                                                Color(
                                                    UIColor(
                                                        red: 255 / 255,
                                                        green: 118 / 255,
                                                        blue: 34 / 255, alpha: 1
                                                    ))
                                            )
                                            .font(
                                                .custom(
                                                    "Roboto-Regular", size: 18)
                                            ).fontWeight(.bold)

                                    }

                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
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

}
