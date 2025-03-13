//
//  LocationAccess.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 13/03/25.
//

import SwiftUI

struct LocationAccess: View {
    @State var isFrom: Bool
    var body: some View {
        VStack{
            
            Spacer().frame(height: 80)
            Image("location_image")
                .resizable()
                .scaledToFill()
                .frame(width: 300,height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            Spacer().frame(height: 20)
            Button(action: {
                // Add button action here
            }) {
                HStack {
                    Text("ACCESS LOCATION")
                        .font(.custom("Roboto-Regular", size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 32, height: 32) // Increased for better visual balance
                        
                        Image(systemName: "location.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16) // Adjusted size for better fit
                            .foregroundColor(.white)
                    }
                    
                }
                .padding()
                
            }
            .padding(.horizontal, 20) // Ensures proper alignment in the parent view
            .frame(maxWidth: .infinity, minHeight: 62)
            .background(Color(UIColor(red: 255/255, green: 118/255, blue: 34/255, alpha: 1)))
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white, lineWidth: 2))
            .padding(20)
        }
        .navigationBarBackButtonHidden(isFrom)
    }
}
