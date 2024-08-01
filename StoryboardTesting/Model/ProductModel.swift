//
//  ProductModel.swift
//  StoryboardTesting
//
//  Created by Cynotecck on 17/04/24.
//

import Foundation
struct ProductModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
