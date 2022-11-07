//
//  HomeEntity.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

struct Products: Codable {
    let products: [Product]?
}

struct Product: Codable {
    let id: Int?
    var title: String?
    var price: Double?
    let description: String?
    let category: String?
    var image: String?
    let rating: Rating?
}

struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
