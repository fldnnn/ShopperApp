//
//  CartContract.swift
//  Shopper
//
//  Created by Fulden Onan on 9.11.2022.
//

import Foundation
import Firebase

class CartInteractor: PresenterToInteractorCartProtocol {
    var presenter: InteractorToPresenterCartProtocol?
    var products = [Detail]()
    let db = Firestore.firestore()
    let userId = Auth.auth().currentUser?.uid
 
    func getAllCartItems() {
        db.collection("\(userId)").getDocuments() { [weak self] (snapshot, error) in
            if error != nil {
            } else {
                if (snapshot?.isEmpty != true), let documents = snapshot?.documents {
                    self?.products.removeAll(keepingCapacity: false)
                    documents.forEach { document in
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: document.data(), options: [])
                            var product = try JSONDecoder().decode(Detail.self, from: jsonData)
                            product.docId = document.documentID
                            self?.products.append(product)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
                    self?.presenter?.sendCartItemsToPresenter(products: self!.products.sorted(by: { $0.title! > $1.title! }))
                } else {
                    self?.presenter?.sendCartItemsToPresenter(products: [])
                }
        }
    }
    }
    
    func deleteFood(productDoc: String, deleteFinished: @escaping () -> ()) {
        db.collection("\(userId)").document(productDoc).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                deleteFinished()
                self.getAllCartItems()
            }
        }
    }
    
    func increaseFoodCount(product: Detail) {
        
            let newCount = product.count! + 1
            self.db.collection("\(self.userId)").document(product.docId!).updateData([
                "count": newCount,
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                    self.getAllCartItems()
                }
            }
    }
    
    func decreaseFoodCount(product: Detail) {
        let newCount = product.count! - 1
        if newCount > 0 {
            self.db.collection("\(self.userId)").document(product.docId!).updateData([
                "count": newCount,
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                    self.getAllCartItems()
                }
            }
        }
    }
}
