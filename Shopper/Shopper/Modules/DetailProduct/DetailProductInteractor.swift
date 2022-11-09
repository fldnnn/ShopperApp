//
//  DetailProductContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation
import Firebase

class DetailProductInteractor: PresenterToInteractorDetailProtocol {
    let db = Firestore.firestore()
    var products = [Detail]()
    let userId = "PMLuvtlWxJVAsP29TnZqt75c76e2"
    
    func addToBasket(product: Detail, username: String) {
        //guard let userId = Auth.auth().currentUser?.uid else { return }
        var sameProduct: Detail?

        getProductsBasket(username: username) {
            sameProduct = self.productIsExists(product: product)
            if sameProduct != nil {
                let oldCount = sameProduct!.count
                let addCount = product.count
                sameProduct!.count = oldCount! + addCount!
                self.db.collection("\(self.userId)").document((sameProduct?.docId!)!).updateData([
                    "count": sameProduct?.count!,
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            } else {
                self.addNewProductToBasket(product: product, username: username)
            }
        }
    }
    
    func getProductsBasket(username: String, completion: @escaping () -> Void) {
                products.removeAll()
                db.collection("\(userId)").getDocuments() { [weak self] (snapshot, error) in
                    if error != nil {
                    } else {
                        if (snapshot?.isEmpty != true), let documents = snapshot?.documents {
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
                    }
                    completion()
                }
            }
    }
    
    func addNewProductToBasket(product: Detail, username: String) {
        let data = (try? JSONEncoder().encode(product)) ?? Data()
        let jsonData  = (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] ?? [:])!
        do {
            let sendData = try db.collection("\(userId)").addDocument(data: jsonData)
            print("here send data: \(sendData)")
        } catch let error {
            print("Error writing product to Firestore: \(error)")
        }
    }

    func productIsExists(product: Detail) -> Detail? {
        let sameProduct = products.first{ $0.id == product.id }
        if sameProduct != nil {
            return sameProduct!
        }
        return nil
    }
}
