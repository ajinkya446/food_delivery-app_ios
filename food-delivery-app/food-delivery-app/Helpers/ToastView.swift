//
//  ToastView.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 07/03/25.
//

import SwiftUI

struct ToastView: View {
    let message: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.title2)
            Text(message)
                .padding()
                .foregroundColor(.white)
                .font(.body)

        }
        .padding(.horizontal,16)
        .background(Color.red.opacity(0.8))
        .clipShape(Capsule())
        .padding(.bottom, 50)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}
