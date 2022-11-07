//
//  HomeInteractor.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func viewDidLoad() {
        homeInteractor?.getProducts()
    }
    
    func onSearchButtonPressed(with searchTerm: String) {
        homeInteractor?.searchProducts(with: searchTerm)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func didDataFecth(with productList: [Product] ) {
        homeView?.updateView(with: productList )
    }
}
