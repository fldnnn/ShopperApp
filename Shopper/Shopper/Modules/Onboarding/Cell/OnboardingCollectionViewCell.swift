//
//  OnboardingCollectionViewCell.swift
//  Shopper
//
//  Created by Fulden Onan on 5.11.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var onboardingImageView: UIImageView!
    @IBOutlet weak var onboardingTitleLabel: UILabel!
    @IBOutlet weak var onboardingDescLabel: UILabel!
    
    func setupCell(with item: OnboardingSlide) {
        onboardingImageView.image = UIImage(named: item.image!)
        onboardingTitleLabel.text = item.title
        onboardingDescLabel.text = item.description
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
