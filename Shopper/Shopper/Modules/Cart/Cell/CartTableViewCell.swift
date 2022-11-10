//
//  CartTableViewCell.swift
//  Shopper
//
//  Created by Fulden Onan on 9.11.2022.
//

import UIKit
import Kingfisher

protocol CellDelegate {
    func increaseProductCount(indexPath: IndexPath)
    func decreaseProductCount(indexPath: IndexPath)

}

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelItemTitle: UILabel!
    @IBOutlet weak var labelItemPrice: UILabel!
    @IBOutlet weak var labelItemCount: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!

    var cellDelegate: CellDelegate?
    var indexPath: IndexPath?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        minusButton.giveElevation()
        plusButton.giveElevation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func fetchData(product: Detail) {
        
        if let url = URL(string: product.image!) {
           
                imageViewItem.kf.setImage(with: url)
            
        }
        labelItemTitle.text = product.title
        labelItemPrice.text = "$\(product.price! * Double(product.count!))"
        labelItemCount.text = "\(product.count!)"
    }
    
    
    @IBAction func increaseCount(_ sender: Any) {
        cellDelegate!.increaseProductCount(indexPath: indexPath! )
    }
    
    @IBAction func decreaseButton(_ sender: Any) {
        cellDelegate!.decreaseProductCount(indexPath: indexPath! )
    }    
}
