//
//  Utils.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 03/03/25.
//
import SwiftUI

struct RoundedTextField: View {
    @Binding var text: String
    var body: some View {
        TextField(
            "", text: $text,
            prompt: Text("Example@gmail.com").foregroundColor(.gray)
        )
        .padding(12)
        .background(
            Color(
                UIColor(
                    red: 240 / 255, green: 245 / 255, blue: 250 / 255, alpha: 1)
            )
        )
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
    @State private var isSecure: Bool = true  // Toggle visibility
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField("* * * * * * * * * *", text: $password)
            } else {
                TextField("* * * * * * * * * *", text: $password)
            }
            
            Button(action: { isSecure.toggle() }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")  // Eye icon toggle
                    .foregroundColor(.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)  // Border
        )
        .padding(.horizontal, 16)
    }
}
