//
//  MagazineCnC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class MagazineCnC: UICollectionViewCell {
    
    @IBOutlet weak var magazineImg: UIImageView!
    @IBOutlet weak var magTitle: UILabel!
    
    func populateWithData(_ section: Int,_ magazine: MagazineList){
        
        magazineImg.layer.cornerRadius = 10
        
        self.magTitle.text = magazine.magazinelist[0].title
        self.magazineImg.image = UIImage(named: "pdf")
//        NetworkManager.shared.getImage(from: "magazines/" + magazine.magazinelist[section].pic) { (image) in
//            DispatchQueue.main.async { [unowned self] in
//                self.productImg.image = image
//            }
//        }
    }
    
}
