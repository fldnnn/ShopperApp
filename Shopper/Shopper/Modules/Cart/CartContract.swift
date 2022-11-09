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
    func deleteFood(productDoc: String)
    func increaseFoodCount(product: Detail)
    func decreaseFoodCount(product: Detail)
}


protocol PresenterToInteractorCartProtocol {
    
    var presenter: InteractorToPresenterCartProtocol? { get set }

    func getAllCartItems()
    func deleteFood(productDoc: String, deleteFinished: @escaping ()->())
    func increaseFoodCount(product: Detail)
    func decreaseFoodCount(product: Detail)
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
