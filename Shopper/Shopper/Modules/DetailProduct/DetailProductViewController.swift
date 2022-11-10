//
//  DetailProductViewController.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth

class DetailProductViewController: UIViewController {

    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet private weak var stepper: UIStepper!
    @IBOutlet private weak var stepperValueLabel: UILabel!
    @IBOutlet weak var addToCartOutlet: UIButton!
    
    var product: Product?
    var detail: Detail?
    var detailPresenterObject: ViewToPresenterDetailProtocol?
//    var kullaniciAdi = "Auth.auth().currentUser!.email"
    var kullaniciAdi = "d@g.co"

    override func viewDidLoad() {
        super.viewDidLoad()
        DetailProductRouter.createModule(ref: self)
        setupDetailUI()
        detailImageView.addShadow()
        addToCartOutlet.cornerButton()
        
        if let p = product {
            priceLabel.text = "$\(p.price!)"
            nameLabel.text = p.title
            descLabel.text = "Description: \(p.description ?? " ")"
        }
        
        if let url = URL(string: (product?.image)!) {
            DispatchQueue.main.async {
                self.detailImageView.kf.setImage(with: url)
            }
        }
    }
    
    private func setupDetailUI() {
        addToCartOutlet.backgroundColor = .black
        navigationController?.navigationBar.tintColor = UIColor.black
        //navigationItem.backButtonTitle = " "
    }

    @IBAction private func stepperButton(_ sender: UIStepper) {
        let stepperValue = stepper.value
        stepperValueLabel.text = "\(Int(stepperValue))"
        print("here \(stepperValue)")
        priceLabel.text = "$\(Int(stepperValue) * Int((product?.price!)!))"
    }

    @IBAction private func addToCart(_ sender: Any) {
        if let product = product {
            let count = Int(stepper.value)
            detail = Detail(image: product.image!, title: product.title!, price: product.price!, description: product.description!, count: count, id: product.id!, docId: "")
        }
        
        if let detail = detail {
            detailPresenterObject?.addProduct(product: detail, username: kullaniciAdi)
        }
    }
}
