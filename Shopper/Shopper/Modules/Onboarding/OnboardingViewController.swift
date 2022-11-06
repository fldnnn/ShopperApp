//
//  OnboardingViewController.swift
//  Shopper
//
//  Created by Fulden Onan on 4.11.2022.
//  
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var slidePageControl: UIPageControl!
    
    // MARK: - Properties
    var presenterObject: Onboarding.ViewToPresenter?
    var collectionViewItemList = [OnboardingSlide]()
    
    var currentPage = 0 {
        didSet {
            slidePageControl.currentPage = currentPage
            if currentPage == collectionViewItemList.count - 1 {
                nextButtonOutlet.setTitle("Get started", for: .normal)
            } else {
                nextButtonOutlet.setTitle("Next", for: .normal)
            }
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
 
        OnboardingRouter.createModule(ref: self)
        
        onboardingCollectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        presenterObject?.viewDidLoad()
    }

    @IBAction func onNextButtonPressed(_ sender: Any) {
        if currentPage == collectionViewItemList.count - 1 {
            print("here")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: Onboarding.PresenterToView {
 
    func updateUI(with items: [OnboardingSlide]) {
        self.collectionViewItemList = items
        self.onboardingCollectionView.reloadData()
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewItemList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slide = collectionViewItemList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setupCell(with: slide)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
