//
//  ProductTbC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class ProductTbC: UITableViewCell {

    var products: ProductList?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func populateWithData(_ products: ProductList){
          self.products = products
          self.collectionView.reloadData()
      }

}
extension ProductTbC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: ProductCnC = collectionView.dequeueReusableCell(withReuseIdentifier: "productCnC", for: indexPath) as? ProductCnC{
        
            if self.products != nil{
                cell.populateWithData(indexPath.item, self.products!)
            }
        
        return cell
        
        }
        return UICollectionViewCell()
    }
}
