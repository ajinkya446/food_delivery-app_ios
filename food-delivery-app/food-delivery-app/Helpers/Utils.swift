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

struct RoundedNameTextField: View {
    @Binding var text: String
    var body: some View {
        TextField(
            "", text: $text,
            prompt: Text("John Doe").foregroundColor(.gray)
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

struct RoundedOTPTextField: View {
    @Binding var code: String
    var maxLength: Int = 6  // Set the maximum length here

    var body: some View {
        TextField(
            "",
            text: $code,
            prompt: Text("Enter CODE here").foregroundColor(.gray)
        )
        .onChange(of: code) { newValue in
            if newValue.count > maxLength {
                code = String(newValue.prefix(maxLength))
            }
        }
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
    @Binding var password: String
    @State private var isSecure: Bool = true
    
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

class OTPManager : ObservableObject {
    @Published var text = ""{
        didSet {
            if text.count > charLimit && oldValue.count <= charLimit{
                text = oldValue
            }
        }
    }
    let charLimit: Int
    
    init(limit: Int = 4){
        charLimit = limit
    }
}

