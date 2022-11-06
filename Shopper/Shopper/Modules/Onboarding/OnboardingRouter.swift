//
//  OnboardingRouter.swift
//  Shopper
//
//  Created by Fulden Onan on 4.11.2022.
//  
//

import UIKit

class OnboardingRouter: Onboarding.Router {
    static func createModule(ref: OnboardingViewController) {
        let presenter = OnboardingPresenter()
        
        ref.presenterObject = presenter
        
        ref.presenterObject?.interactor = OnboardingInteractor()
        ref.presenterObject?.view = ref
        
        ref.presenterObject?.interactor?.presenter = presenter
    }       
}
