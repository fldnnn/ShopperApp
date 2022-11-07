//
//  HomeInteractor.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol? {get set}
    var homeView: PresenterToViewHomeProtocol? {get set}
    
    func viewDidLoad()
    func onSearchButtonPressed(with searchTerm: String)
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol? {get set}
    
    func getProducts()
    func searchProducts(with searchTerm: String)
}

protocol InteractorToPresenterHomeProtocol {
    func didDataFecth(with productList: [Product])
}

protocol PresenterToViewHomeProtocol {
    func updateView(with productList: [Product])
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController)
}
