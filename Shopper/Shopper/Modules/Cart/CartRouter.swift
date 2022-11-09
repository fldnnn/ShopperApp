//
//  CartContract.swift
//  Shopper
//
//  Created by Fulden Onan on 9.11.2022.
//

import Foundation

class CartRouter: PresenterToRouterCartProtocol {
   
    static func createModule(ref: CartViewController) {
        let presenter = CartPresenter()
        
        ref.presenter = presenter
                
        ref.presenter?.interactor = CartInteractor()
        ref.presenter?.view = ref
        
        ref.presenter?.interactor?.presenter = presenter
    }    
}
