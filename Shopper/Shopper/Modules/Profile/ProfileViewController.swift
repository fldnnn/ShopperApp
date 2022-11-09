//
//  ProfileViewController.swift
//  Shopper
//
//  Created by Fulden Onan on 9.11.2022.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var logOutOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logOutOutlet.cornerButton()
    }

    @IBAction func logOutButton(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.set(false, forKey: "status")
            Switcher.updateRootVC()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
