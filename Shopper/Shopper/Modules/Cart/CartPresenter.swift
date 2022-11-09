//
//  CartContract.swift
//  Shopper
//
//  Created by Fulden Onan on 9.11.2022.
//

import Foundation

class CartPresenter: ViewToPresenterCartProtocol {
    var interactor: PresenterToInteractorCartProtocol?
    var view: PresenterToViewCartProtocol?
    
    func getAllCartItems() {
        interactor?.getAllCartItems()
    }
    
    func deleteFood(productDoc: String) {
        interactor?.deleteFood(productDoc: productDoc) {
            self.interactor?.getAllCartItems()
        }
    }
    
    func increaseFoodCount(product: Detail) {
        interactor?.increaseFoodCount(product: product)
    }
    
    func decreaseFoodCount(product: Detail) {
        interactor?.decreaseFoodCount(product: product)
    }
}


extension CartPresenter: InteractorToPresenterCartProtocol {
    func sendCartItemsToPresenter(products: [Detail]) {
        view?.sendCartItemsToView(products: products)
    }
}
