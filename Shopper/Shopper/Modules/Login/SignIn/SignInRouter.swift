//
//  SignInContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

class SignInRouter: PresenterToRouterSignInProtocol {
    static func createModuler(ref: SignInViewController) {
        let presenter = SignInPresenter()
        ref.signInPresenter = presenter
        
        ref.signInPresenter?.signInView = ref
        ref.signInPresenter?.signInInteractor = SignInInteractor()
        
        ref.signInPresenter?.signInInteractor?.signInPresenter = presenter
    }
}
