//
//  OnboardingInteractor.swift
//  Shopper
//
//  Created by Fulden Onan on 4.11.2022.
//  
//

import Foundation

class OnboardingInteractor: Onboarding.PresenterToInteractor {
    
    var presenter: Onboarding.InteractorToPresenter?
    
    var items: [OnboardingSlide] = [OnboardingSlide(title: "Online Shopping", description: "Find your favourite products that you need to buy daily.", image: "slide1"),  OnboardingSlide(title: "Best Price", description: "Holiday sales. Birthday gifts. Various choice and categories.", image: "slide2"),
        OnboardingSlide(title: "Product Delivery", description: "Your products are delivered home safely & securely.", image: "slide3")]
    
    func getItems() {
        presenter?.didItemsGet(with: items)
    }
}

