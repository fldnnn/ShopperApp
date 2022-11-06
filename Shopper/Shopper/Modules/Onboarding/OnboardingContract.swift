//
//  OnboardingContract.swift
//  Shopper
//
//  Created by Fulden Onan on 4.11.2022.
//  
//

import Foundation

protocol OnboardingViewToPresenterProtocol {
    var view: Onboarding.PresenterToView? { get set }
    var interactor: Onboarding.PresenterToInteractor? { get set }
    
    func viewDidLoad()
}

protocol OnboardingPresenterToInteractorProtocol {
    var presenter: Onboarding.InteractorToPresenter? { get set }
    
    func getItems()
}

protocol OnboardingInteractorToPresenterProtocol: AnyObject {
    func didItemsGet(with items: [OnboardingSlide])
}

protocol OnboardingPresenterToViewProtocol: AnyObject {
    func updateUI(with items: [OnboardingSlide])
}

protocol OnboardingRouterProtocol: AnyObject {
    static func createModule(ref: OnboardingViewController)
  
}

struct Onboarding {
    typealias ViewToPresenter = OnboardingViewToPresenterProtocol
    typealias PresenterToInteractor = OnboardingPresenterToInteractorProtocol
    typealias InteractorToPresenter = OnboardingInteractorToPresenterProtocol
    typealias PresenterToView = OnboardingPresenterToViewProtocol
    typealias Router = OnboardingRouterProtocol
}
