//
//  ContentView.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 28/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        if(isActive){
            LoginScreen()
        }else{
            VStack{
                Image("logo").resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline:.now() + 3){
                    isActive = true;
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
