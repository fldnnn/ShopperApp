//
//  SignInViewController.swift
//  Shopper
//
//  Created by Fulden Onan on 6.11.2022.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailLoginTf: UITextField!
    @IBOutlet weak var passwordLoginTf: UITextField!
    @IBOutlet weak var loginErrorLabel: UILabel!
    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var signUpOutlet: UIButton!
    
    var signInPresenter: ViewToPresenterSignInProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginErrorLabel.alpha = 0
        
        SignInRouter.createModuler(ref: self)
        signUpOutlet.cornerButton()
        signInOutlet.cornerButton()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailLoginTf.text, let password = passwordLoginTf.text {
            signInPresenter?.onSignInButtonPressed(email: email, password: password)
        }
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if (user != nil) {
                UserDefaults.standard.set(true, forKey: "status")
                Switcher.updateRootVC()
            }
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
}

extension SignInViewController: PresenterToViewSignInProtocol {
    func updateView(with error: String) {
        loginErrorLabel.text = error
        loginErrorLabel.alpha = 1
    }
}
