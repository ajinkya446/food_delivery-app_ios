//
//  LoginScreen.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 28/02/25.
//

import SwiftUI

struct LoginScreen : View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 18/255, green: 18/255, blue: 35/255, alpha: 1))
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack(alignment: .center){
                    Spacer().frame(height: 120)
                    Text("Log In")
                        .font(.custom("Roboto-Bold", size: 30))
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
                            RoundedTextField()
                            Spacer().frame(height: 20)
                            Text("Password")
                                .foregroundColor(Color(UIColor(red: 50/255, green: 52/255, blue: 62/255, alpha: 1)))
                                .font(.custom("Roboto-Regular", size: 16)).fontWeight(.medium)
                                .padding(.horizontal,16)
                            Spacer().frame(height: 20)
                            PasswordTextField()
                            Spacer().frame(height: 20)
                            Text("Forget Password")
                                .foregroundColor(Color(UIColor(red: 255/255, green: 118/255, blue: 34/255, alpha: 1)))
                                .font(.custom("Roboto-Regular", size: 16)).fontWeight(.medium)
                                .padding(.horizontal,16)
                            Spacer().frame(height: 40)
                            Button(action: {
                                print("LOGIN Button Clicked")
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
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            Spacer().frame(height: 20)
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
    
    struct RoundedTextField: View {
        @State private var text: String = ""

        var body: some View {
            TextField("", text: $text,prompt: Text("Example@gmail.com").foregroundColor(.gray))
                .padding(12)
                .background(Color(UIColor(red: 240/255, green: 245/255, blue: 250/255, alpha: 1)))
                    .cornerRadius(10)
                .padding(.horizontal, 16)
        }
    }

    
    struct RoundedCornerShape: Shape {
        var radius: CGFloat
        var corners: UIRectCorner

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
    
    struct PasswordTextField: View {
        @State private var password: String = ""
        @State private var isSecure: Bool = true // Toggle visibility

        var body: some View {
            HStack {
                if isSecure {
                    SecureField("* * * * * * * * * *", text: $password)
                } else {
                    TextField("* * * * * * * * * *", text: $password)
                }

                Button(action: { isSecure.toggle() }) {
                    Image(systemName: isSecure ? "eye.slash" : "eye") // Eye icon toggle
                        .foregroundColor(.gray)
                }
            }
            .padding(12)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1) // Border
            )
            .padding(.horizontal, 16)
        }
    }

}
