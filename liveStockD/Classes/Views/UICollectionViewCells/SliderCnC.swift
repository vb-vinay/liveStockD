//
//  SliderCnC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class SliderCnC: UICollectionViewCell {
    
    @IBOutlet weak var sliderImg: UIImageView!
    
    func populateWithData(_ slider: SliderList){

        sliderImg.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        sliderImg.layer.cornerRadius = 10
        
        NetworkManager.shared.getImage(from: "sliders/" + slider.sliderlist[0].image) { (image) in
            DispatchQueue.main.async { [unowned self] in
                self.sliderImg.image = image
            }
        }
    }
}
