//
//  SignUpContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

protocol ViewToPresenterSignUpProtocol {
    var interactor: PresenterToInteractorSignUpProtocol? { get set }
    func onSignUpButtonPressed(email: String, password: String)
}

protocol PresenterToInteractorSignUpProtocol {
    func signUp(email: String, password: String)
}

protocol PresenterToRouterSignUpProtocol {
    static func  createModule(ref: SignUpViewController)
}

