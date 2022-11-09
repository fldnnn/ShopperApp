//
//  HomeEntity.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

struct Products: Codable {
    let products: [Product]?
    
    enum CodingKeys: String, CodingKey {
        case products
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
    }
}

struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating?
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, image, rating
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
    }
}

struct Rating: Codable {
    let rate: Double?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case rate, count
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }
}
