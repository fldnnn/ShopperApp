//
//  DetailEntity.swift
//  Shopper
//
//  Created by Fulden Onan on 8.11.2022.
//

import Foundation

struct Detail: Codable {
    var image: String?
    var title: String?
    var price: Double?
    var description: String?
    var count: Int?
    var id: Int?
    var docId: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, description, count, image, docId
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        docId = try values.decodeIfPresent(String.self, forKey: .docId)
    }
    
    init(image: String, title: String, price: Double, description: String, count: Int, id: Int, docId: String) {
        self.image = image
        self.title = title
        self.price = price
        self.description = description
        self.count = count
        self.id = id
        self.docId = docId
    }
}
