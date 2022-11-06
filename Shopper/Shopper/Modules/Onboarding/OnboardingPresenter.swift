//
//  OnboardingPresenter.swift
//  Shopper
//
//  Created by Fulden Onan on 4.11.2022.
//  
//

import Foundation

class OnboardingPresenter: Onboarding.ViewToPresenter {
   
    var view: Onboarding.PresenterToView?
    var interactor: Onboarding.PresenterToInteractor?
    
    func viewDidLoad() {
        interactor?.getItems()
        print("here presnter")
    }
}

extension OnboardingPresenter: Onboarding.InteractorToPresenter {
    func didItemsGet(with items: [OnboardingSlide]) {
        view?.updateUI(with: items)
    }
}
