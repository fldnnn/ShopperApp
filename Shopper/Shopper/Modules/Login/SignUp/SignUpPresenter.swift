//
//  SignUpContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

class SignUpPresenter: ViewToPresenterSignUpProtocol {
    var interactor: PresenterToInteractorSignUpProtocol?
    
    func onSignUpButtonPressed(email: String, password: String) {
        interactor?.signUp(email: email, password: password)
    }
}
