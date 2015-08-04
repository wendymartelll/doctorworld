//
//  ProductScrollViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ProductScrollViewController : UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var stockLabel : UILabel!
    @IBOutlet var priceLabel : UILabel!
    @IBOutlet var saleLabel  : UILabel!
    
    @IBOutlet var colorContainerView  : UIView!
    @IBOutlet var sizeContainerView  : UIView!
    @IBOutlet var spacerView  : UIView!
    
    @IBOutlet var sizeLabel  : UILabel!
    @IBOutlet var colorLabel  : UILabel!
    @IBOutlet var sizeValueLabel  : UILabel!
    @IBOutlet var colorValueLabel  : UILabel!
    
    @IBOutlet var descriptionLabel  : UILabel!
    @IBOutlet var orderButton  : UIButton!
    
    @IBOutlet var productCollectionView : UICollectionView!
    @IBOutlet var productCollectionLayout : UICollectionViewFlowLayout!
    
    @IBOutlet var otherItemsCollectionView : UICollectionView!
    @IBOutlet var otherItemsCollectionLayout : UICollectionViewFlowLayout!
    
    let productImageHeight: CGFloat = 300
    
    var relatedProducts : [Product]!
    var products : [Product]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ScrollView.contentSize.height = 1000
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.backgroundColor = UIColor(white: 0.92, alpha: 1.0)
        
        productCollectionLayout.minimumLineSpacing = 10
        productCollectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        productCollectionLayout.itemSize = CGSizeMake(productImageHeight - 15, productImageHeight - 15)
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.text = "Ocean Dental"
        
        stockLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        stockLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        stockLabel.text = "Cancun - Mexico"
        
        saleLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        saleLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        let salePrice = NSMutableAttributedString(string: "$177")
        salePrice.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, salePrice.length))
        saleLabel.attributedText = salePrice
        
        priceLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        priceLabel.textColor = UIColor.blueColor()
        priceLabel.text = "$144"
        
        colorContainerView.backgroundColor = UIColor.whiteColor()
        sizeContainerView.backgroundColor = UIColor.whiteColor()
        spacerView.backgroundColor = UIColor(white: 0.7, alpha: 1.0)
        
        colorLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        colorLabel.textColor = UIColor.blackColor()
        colorLabel.text = "Color"
        
        sizeLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        sizeLabel.textColor = UIColor.blackColor()
        sizeLabel.text = "Size"
        
        sizeValueLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        sizeValueLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        sizeValueLabel.text = "M"
        
        colorValueLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        colorValueLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        colorValueLabel.text = "Blue"
        
        descriptionLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        descriptionLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        descriptionLabel.text = "Ocean Dental, a fully equipped dental clinic in Cancun, Mexico, is certified by the American Dental Association, and offers a full range of dental services at much lower rates than comparable dental facilities in the United States and Canada. Ocean Dental has been in operation for 12 years. The experienced dentists practicing at the facility speak English and are either U.S.-licensed or U.S.-trained dentists, skilled in the most up-to-date dental procedures and technology. Ocean Dental uses the latest equipment and best materials. Dental work done at the clinic is guaranteed for up to ten years. Sedation by an anesthesiologist is also offered as an option for your procedure, if desired."
        
        orderButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        orderButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        orderButton.setTitle("SELECT CLINIC", forState: .Normal)
        orderButton.backgroundColor = UIColor(red: 0.14, green: 0.71, blue: 0.32, alpha: 1.0)
        orderButton.layer.cornerRadius = 20
        orderButton.layer.borderWidth = 0;
        orderButton.clipsToBounds = true;
        
        otherItemsCollectionView.delegate = self
        otherItemsCollectionView.dataSource = self
        otherItemsCollectionView.backgroundColor = UIColor.clearColor()
        
        otherItemsCollectionLayout.minimumInteritemSpacing = 0
        otherItemsCollectionLayout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        otherItemsCollectionLayout.itemSize = CGSizeMake(cellWidth, cellWidth)
        
        let relatedProduct1 = Product(title: "Hospident", price: "Cancun", image: "Shop_hospident-surgery-room")
        let relatedProduct2 = Product(title: "Dental Evolution", price: "Cancun", image: "Shop_dental-evolution-reception-3")
        let relatedProduct3 = Product(title: "Sunset Dental", price: "Cancun", image: "Shop_sunset-dental-cancun-beach-view")
        let relatedProduct4 = Product(title: "Dental Specialists", price: "Cancun", image: "Shop_cancun-specialists-reception")
        
        relatedProducts = [relatedProduct1, relatedProduct2, relatedProduct3, relatedProduct4]
        

        let product1 = Product(title: "", price: "", image: "Ocean Dental")
        let product2 = Product(title: "", price: "", image: "oc-doctor")
        let product3 = Product(title: "", price: "", image: "oc_patient-waiting-ar")
        let product4 = Product(title: "", price: "", image: "oc-reception-desk")
        let product5 = Product(title: "", price: "", image: "oc-seating-area-1")
        let product6 = Product(title: "", price: "", image: "oc-seating-area")
        let product7 = Product(title: "", price: "", image: "oc-seating-area-1a")
        let product8 = Product(title: "", price: "", image: "oc-treatment-room-2a")
        let product9 = Product(title: "", price: "", image: "oc-treatment-room-1a")
        let product10 = Product(title: "", price: "", image: "oc-treatment-room-1b")
        let product11 = Product(title: "", price: "", image: "oc-treatment-room-1")
        let product12 = Product(title: "", price: "", image: "oc-sterilization-room")
        let product13 = Product(title: "", price: "", image: "oc-system-5-axis")
        let product14 = Product(title: "", price: "", image: "oc-system")
        let product15 = Product(title: "", price: "", image: "oc-treatment-room-1")
        let product16 = Product(title: "", price: "", image: "oc-zirconium-blocks")
        let product17 = Product(title: "", price: "", image: "oc-front-door")
        
        
        
    
        products = [product1, product2, product3, product4, product5, product6, product7, product8, product9, product10, product11, product12, product13, product14, product15, product16, product17]
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return productImageHeight
        } else if indexPath.row == 3 {
            return 120
        }else if indexPath.row == 4 {
            return 70
        }else if indexPath.row == 5 {
            return 400
        }else{
            return 45
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.selectionStyle = .None
    }
    
    override func viewDidLayoutSubviews() {
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView == productCollectionView {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductImageCell", forIndexPath: indexPath) as! ProductImageCell
            let index = indexPath.row % products.count
            let product = products[index]
            cell.productImageView.image = UIImage(named: product.image)
            
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
            
            let index = indexPath.row % relatedProducts.count
            let product = relatedProducts[index]
            cell.imageView.image = UIImage(named: product.image)
            cell.titleLabel.text = product.title
            cell.priceLabel.text = product.price

            return cell
        }
    }
    

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView {
            return 17;
        }else{
            return relatedProducts.count
        }
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