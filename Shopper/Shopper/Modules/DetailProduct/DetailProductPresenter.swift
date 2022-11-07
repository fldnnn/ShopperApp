//
//  DetailProductContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

class DetailProductPresenter: ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol?
    
    func addFood(product: Product, count: Int, username: String) {
        detailInteractor?.addToBasket(product: product, count: count, username: username)
    }
}
