//
//  SignInContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation
import FirebaseAuth

class SignInInteractor: PresenterToInteractorSignInProtocol {
    var signInPresenter: InteractorToPresenterSignInProtocol?
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                let errorMessage = error?.localizedDescription
                self.signInPresenter?.showErr(with: errorMessage!)
            } else {
                print(result!)
            }
        }
    }
}
