//
//  HomeInteractor.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    func getProducts() {
        AF.request("https://fakestoreapi.com/products", method: .get).response { [weak self] response in
            guard let self = self else { return }
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode([Product].self, from: data)
                    print(response)
                    //if let list = response {
                        DispatchQueue.main.async {
                            self.homePresenter?.didDataFecth(with: response)
                        }
                    //}
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchProducts(with searchTerm: String) {
        AF.request("https://fakestoreapi.com/products", method: .get).response { [weak self] response in
            guard let self = self else { return }
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode([Product].self, from: data)
                    print(data)
                    //if let list = response as? [Product] {
                        print(response)
                        var searchedProductList = [Product]()
                        for product in response {
                            if product.title!.lowercased().contains(searchTerm.lowercased()) {
                                searchedProductList.append(product)
                            }
                        }
                        DispatchQueue.main.async {
                            self.homePresenter?.didDataFecth(with: searchedProductList)
                        }
                    //}
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
