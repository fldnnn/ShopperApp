//
//  SignUpContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

class SignUpRouter: PresenterToRouterSignUpProtocol {
    static func createModule(ref: SignUpViewController) {
        ref.signUpPresenter = SignUpPresenter()
        ref.signUpPresenter?.interactor = SignUpInteractor()
    }
}
