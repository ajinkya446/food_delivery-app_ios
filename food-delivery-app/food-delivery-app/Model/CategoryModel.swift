//
//  CategoryModel.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 17/03/25.
//

struct CategoryModel: Identifiable, Codable {
    let id: Int
    let name: String
    let foodImage: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case foodImage = "food_image"
    }
}
