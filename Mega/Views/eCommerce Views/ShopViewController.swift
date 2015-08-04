//
//  ShopViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ShopViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    let cellHeight : CGFloat = 200
    
    var products : [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        

        let rightBarItem = UIBarButtonItem(image: UIImage(named: "cart"), style: .Plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarItem
        
        title = "Cancun"
        
        let product1 = Product(title: "Ocean Dental ", price: "Cancun", image: "Ocean Dental")
        let product2 = Product(title: "Dental Specialists", price: "Cancun", image: "Shop_cancun-specialists-reception")
        let product3 = Product(title: "Hospident", price: "Cancun", image: "Shop_hospident-surgery-room")
        let product4 = Product(title: "Inter Dental", price: "Cancun", image: "Shop_inter-dental-treatment-room-27")
        let product5 = Product(title: "Dental Evolution", price: "Cancun", image: "Shop_dental-evolution-reception-3")
        let product6 = Product(title: "Sunset Dental", price: "Cancun", image: "Shop_sunset-dental-cancun-beach-view")
        
        products = [product1, product2, product3, product4, product5, product6]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
        let index = indexPath.row % products.count
        let product = products[index]
        cell.imageView.image = UIImage(named: product.image)
        cell.titleLabel.text = product.title
        cell.priceLabel.text = product.price
        
        return cell
    }
    // To COnnect
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0
        {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ProductScrollViewController") as! ProductScrollViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ProductCell
        cell.setCellSelected(true)
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ProductCell
        cell.setCellSelected(false)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var headerView : UICollectionReusableView!
        
        if kind == "UICollectionElementKindSectionHeader"{
            headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ShopHeaderView", forIndexPath: indexPath) as? UICollectionReusableView
            
            let headerTitleLabel = headerView.viewWithTag(1) as! UILabel
            headerTitleLabel.font = UIFont(name: MegaTheme.fontName, size: 14)
            headerTitleLabel.textColor = UIColor(white: 0.4, alpha: 1.0)
            
            headerTitleLabel.text = "DENTAL CLINICS"
            
        }
        return headerView
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        var cellWidth = calcCellWidth(size)
        layout.itemSize = CGSizeMake(cellWidth, 200)
    }
    
    func calcCellWidth(size: CGSize) -> CGFloat {
        let transitionToWide = size.width > size.height
        var cellWidth = size.width / 2
        
        if transitionToWide {
            cellWidth = size.width / 3
        }

        return cellWidth
    }
}

class Product {

    var title : String!
    var image : String!
    var price : String!
    
    init(title: String, price : String, image: String){
        self.title = title
        self.price = price
        self.image = image
    }
}

