//
//  HomeScreen.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 17/03/25.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchValue: String = ""
    @State private var foodCategory: [CategoryModel] = [
        CategoryModel(id: 0, name: "All", foodImage: "diet"),
        CategoryModel(id: 1, name: "Veg", foodImage: "thali"),
        CategoryModel(id: 3, name: "Indian", foodImage: "tortilla"),
        CategoryModel(id: 4, name: "South Indian", foodImage: "masala-dosa"),
        CategoryModel(id: 5, name: "Italian", foodImage: "spaghetti")
    ]
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                
                // Menu Icon in Circle
                ZStack {
                    Circle()
                        .fill(Color(red: 0xEC / 255.0, green: 0xF0 / 255.0, blue: 0xF4 / 255.0))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "line.3.horizontal.decrease")
                                .frame(width: 16, height: 16)
                                .foregroundColor(.black)
                        )
                }
                
                // Text Section
                VStack(alignment: .leading, spacing: 4) {
                    Text("DELIVER TO")
                        .font(.custom("Roboto-Bold", size: 16))
                        .foregroundColor(Color(red: 0xFC / 255.0, green: 0x6E / 255.0, blue: 0x2A / 255.0))
                    
                    Text("Halal Lab Office")
                        .font(.custom("Roboto-Regular", size: 14))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10) // Adjust spacing between icon and text
                
                Spacer()
                
                // Cart Icon with Badge
                ZStack(alignment: .topTrailing) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "cart.fill")
                                .foregroundColor(.white)
                        )
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Text("2")
                                .font(.custom("Roboto-Regular", size: 12))
                                .foregroundColor(.white)
                        )
                        .offset(x: 10, y: -5)
                }
                
            }
            .frame(height: 50)
            Spacer().frame(height: 30)
            
            HStack(){
                Text("Hey Halal,")
                    .font(.custom("Roboto-regular", size: 18))
                    .foregroundColor(.black)
                Spacer().frame(width:8)
                Text("Good Afternoon!")
                    .font(.custom("Roboto-Bold", size: 20))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Spacer().frame(height: 30)
            
            /// Search bar component
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search Dishes, Restaurants", text: $searchValue)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            Spacer().frame(height: 30)
            HStack{
                Text("All Categories")
                    .font(.custom("Roboto-Bold", size: 16))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Spacer()
                HStack{
                    Text("See All")
                        .font(.custom("Roboto-Bold", size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.light)
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity)
            Spacer().frame(height: 12)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(foodCategory) { category in
                        HStack {
                            Image(category.foodImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 36, height: 36)
                                .clipShape(Circle())
                                .padding(.trailing, 12)
                            
                            Text(category.name)
                                .font(.custom("Roboto-Bold", size: 16))
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .cornerRadius(24)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                }
            }.frame(height: 60)
            Spacer().frame(height: 30)
            HStack{
                Text("Open Restaurants")
                    .font(.custom("Roboto-Bold", size: 16))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Spacer()
                HStack{
                    Text("See All")
                        .font(.custom("Roboto-Bold", size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.light)
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity)
            Spacer().frame(height: 12)
        }
        .frame(maxHeight:.infinity, alignment:  .top)
        .padding(.horizontal,16)
    }
}
