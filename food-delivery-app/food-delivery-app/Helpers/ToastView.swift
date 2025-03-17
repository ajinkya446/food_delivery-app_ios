//
//  ToastView.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 07/03/25.
//

import SwiftUI

struct ToastView: View {
    @ObservedObject var toastManager = ToastManager.shared   //accessing singleton

    var body: some View {
        if toastManager.showToast{
            HStack {
                Image(systemName: toastManager.icon)
                    .foregroundColor(.white)
                    .font(.title2)
                Text(toastManager.contentMessage)
                    .padding()
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Medium", size: 18))
                    .font(.body)
                
            }
            .padding(.horizontal,16)
            .background(Color.red.opacity(1))
            .clipShape(Capsule())
            .padding(.bottom, 50)
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
    }
}


class ToastManager: ObservableObject{
    static let shared = ToastManager()  // Created Singleton instance for using accross multiple screens
    
    @Published var showToast = false
    @Published var contentMessage = ""
    @Published var icon = ""
    
    private init(){}     // Private constructor enforces singleton instances.
    
    func showToastMessage(message: String, icon:String){
        self.contentMessage = message
        self.icon = icon
        
        
        withAnimation{
            showToast = true
        }
        
        
        Task{
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            DispatchQueue.main.async{
                self.showToast = false
            }
        }
    }
    
    
}
