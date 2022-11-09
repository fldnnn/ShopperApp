//
//  HomeViewController.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var productSearchBar: UISearchBar!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var productList = [Product]()
    
    var homePresenterObject: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        HomeRouter.createModule(ref: self)
        setupUI()

        homePresenterObject?.viewDidLoad()
        
        productSearchBar.delegate = self
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        
       productCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    private func setupUI() {
        //CollectionView
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 30) / 2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        productCollectionView.collectionViewLayout = design
        
        //TabBar
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBarController?.tabBar.frame.size.height = 50
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
//        let username = UserDefaults.standard.value(forKey: "username")
//        userNameLabel.text = "Merhaba \(username ?? "")!"
    }
    
    private func changeColor(itemAppearance: UITabBarItemAppearance) {
        itemAppearance.selected.iconColor = .systemPink
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let product = sender as? Product {
                let detailVC = segue.destination as! DetailProductViewController
                detailVC.product = product
            }
        }
    }
}

extension HomeViewController: PresenterToViewHomeProtocol {
    func updateView(with productList: [Product]) {
        self.productList = productList
        self.productCollectionView.reloadData()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            homePresenterObject?.viewDidLoad()
        } else {
            homePresenterObject?.onSearchButtonPressed(with: searchText)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = productList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.productTitleLabel.text = "\(product.title!)"
    
        if let url = URL(string: product.image!) {
            DispatchQueue.main.async {
                cell.productImageView.kf.setImage(with: url)
            }
        }
        cell.addCornerCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: product)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
