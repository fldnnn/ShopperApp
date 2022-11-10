//
//  CartContract.swift
//  Shopper
//
//  Created by Fulden Onan on 9.11.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    
    var interactor: PresenterToInteractorCartProtocol? { get set }
    var view: PresenterToViewCartProtocol? { get set }
    
    func getAllCartItems()
    func deleteProduct(productDoc: String)
    func increaseProductCount(product: Detail)
    func decreaseProductCount(product: Detail)
}


protocol PresenterToInteractorCartProtocol {
    
    var presenter: InteractorToPresenterCartProtocol? { get set }

    func getAllCartItems()
    func deleteProduct(productDoc: String, deleteFinished: @escaping ()->())
    func increaseProductCount(product: Detail)
    func decreaseProductCount(product: Detail)
}

protocol InteractorToPresenterCartProtocol {
    
    func sendCartItemsToPresenter(products: [Detail])
}


protocol PresenterToViewCartProtocol {
    
    func sendCartItemsToView(products: [Detail])
}


protocol PresenterToRouterCartProtocol {
    
    static func createModule(ref: CartViewController)
}
