//
//  SignUpViewController.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTf: UITextField!
    @IBOutlet weak var lastNameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var passwordConfirmTf: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpOutlet: UIButton!
    
    var signUpPresenter: ViewToPresenterSignUpProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        
        SignUpRouter.createModule(ref: self)
        signUpOutlet.cornerButton()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if let email = emailTf.text, let password = passwordTf.text, let passwordConfirm = passwordConfirmTf.text {
            let error = validateFields()
            if error != nil {
                showError(with: error!)
            } else {
                signUpPresenter?.onSignUpButtonPressed(email: email, password: password)
                UserDefaults.standard.set(firstNameTf.text, forKey: "username")
                UserDefaults.standard.set(false, forKey: "status")
                self.dismiss(animated: true)
            }
        }
    }
    
    func validateFields() -> String? {
        if emailTf.text?.isValidEmail() == false {
            return "Please enter a valid e-mail!"
        }
        
        let cleanedPassword = passwordTf.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedPassword?.isPasswordValid() == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        if firstNameTf.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTf.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTf.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTf.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        if passwordTf.text != passwordConfirmTf.text {
            return "Confirm password doesn't match password."
        }
        return nil
    }
    
    func showError(with message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}

