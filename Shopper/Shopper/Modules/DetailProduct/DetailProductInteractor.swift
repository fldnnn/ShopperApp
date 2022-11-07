//
//  DetailProductContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation
import Firebase

class DetailProductInteractor:PresenterToInteractorDetailProtocol {
    var cartProductList: Product?
    var imageUrl = [String]()
    let db = Firestore.firestore()
    
    func addToBasket(product: Product, count: Int, username: String) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        if let image = product.image, let price = product.price, let title = product.title {
            let firestoreCart = ["imageUrl": image, "email": Auth.auth().currentUser!.email!, "price": price, "productTitle": title, "productCount": count] as [String : Any]
            db.collection("\(userId)").addDocument(data: firestoreCart) {
                error in
                if error != nil {
                    
                } else {
                    
                }
            }
        }
    }
}
