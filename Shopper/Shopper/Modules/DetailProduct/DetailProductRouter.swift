//
//  DetailProductContract.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation

class DetailProductRouter: PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailProductViewController) {
        ref.detailPresenterObject = DetailProductPresenter()
        ref.detailPresenterObject?.detailInteractor = DetailProductInteractor()
    }
}
