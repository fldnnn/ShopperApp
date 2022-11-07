//
//  HomeInteractor.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController) {
        let presenter = HomePresenter()
        
        ref.homePresenterObject = presenter
        
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref
        
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
}
