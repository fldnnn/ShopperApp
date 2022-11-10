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
    
    func deleteProduct(productDoc: String) {
        interactor?.deleteProduct(productDoc: productDoc) {
            self.interactor?.getAllCartItems()
        }
    }
    
    func increaseProductCount(product: Detail) {
        interactor?.increaseProductCount(product: product)
    }
    
    func decreaseProductCount(product: Detail) {
        interactor?.decreaseProductCount(product: product)
    }
}


extension CartPresenter: InteractorToPresenterCartProtocol {
    func sendCartItemsToPresenter(products: [Detail]) {
        view?.sendCartItemsToView(products: products)
    }
}
