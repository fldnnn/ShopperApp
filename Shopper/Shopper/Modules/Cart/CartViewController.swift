//
//  CartViewController.swift
//  Shopper
//
//  Created by Fulden Onan on 9.11.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var deleteButtonOutlet: UIButton!
    
    var presenter: ViewToPresenterCartProtocol?
    
    var cartProductList: [Detail] = [Detail]()
    var totalPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cart"
        self.navigationItem.backBarButtonItem?.title = ""
        totalPriceLabel.text = "\(totalPrice)"

        cartTableView.delegate = self
        cartTableView.dataSource = self
        CartRouter.createModule(ref: self )
        
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
    }
    @IBAction func deleteAllProducts(_ sender: Any) {
        let alert = UIAlertController(title: "Delete All", message: "Are you sure you want to empty all items in the cart?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Yes", style: .destructive) { [weak self] action in
            for item in (self?.cartProductList)! {
                self?.presenter?.deleteFood(productDoc: item.docId!)
            }
        }
        alert.addAction(deleteAction)
        
        self.present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getAllCartItems()
    }
    
    func calculateTotalPrice() {
        totalPrice = 0.0
        for product in cartProductList {
            totalPrice = totalPrice + (Double(product.count!) * (product.price!))
        }
        totalPriceLabel.text = "Total price: $\(String(format: "%.2f", totalPrice))"
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cartProductList.count == 0 {
            emptyStateView.isHidden = false
            return cartProductList.count
        } else {
            emptyStateView.isHidden = true
            return cartProductList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell

        let product = cartProductList[indexPath.row]
        cell.indexPath = indexPath
        cell.fetchData(product: product)
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction,view,bool) in
            let product = self.cartProductList[indexPath.row]

            let alert = UIAlertController(title: "Delete", message: "\(product.title!) will delete?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in }
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                
                self.presenter?.deleteFood(productDoc: product.docId!)
            }
            
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}

extension CartViewController: PresenterToViewCartProtocol {
    func sendCartItemsToView(products: [Detail]) {
        cartProductList = products
        cartTableView.reloadData()
   
        if cartProductList.count == 0 {
            totalPriceLabel.isHidden = true
            deleteButtonOutlet.isHidden = true
        } else {
            totalPriceLabel.isHidden = false
            deleteButtonOutlet.isHidden = false
            calculateTotalPrice()
        }
    }
}

extension CartViewController: CellDelegate {
    func increaseFoodCount(indexPath: IndexPath) {
        presenter?.increaseFoodCount(product: cartProductList[indexPath.row])
    }
    
    func decreaseFoodCount(indexPath: IndexPath) {
        presenter?.decreaseFoodCount(product: cartProductList[indexPath.row])
    }
}
