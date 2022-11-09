//
//  DetailProductContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol? {get set}
    
    func addFood(product: Detail, username: String)
}

protocol PresenterToInteractorDetailProtocol {
    func addToBasket(product: Detail, username: String)
}

protocol PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailProductViewController)
}
