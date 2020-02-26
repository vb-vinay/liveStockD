//
//  ProductCnC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class ProductCnC: UICollectionViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var avlStock: UILabel!
    
    func populateWithData(_ section: Int,_ product: ProductList){
        
        productImg.layer.cornerRadius = 10
        
        self.price.text = "Rs. " + product.productlist[section].price + " " + product.productlist[section].title
        self.avlStock.text = "Available Stock: " + product.productlist[section].quantity
        
        NetworkManager.shared.getImage(from: "products/" + product.productlist[section].pic) { (image) in
            DispatchQueue.main.async { [unowned self] in
                self.productImg.image = image
            }
        }
    }
}
