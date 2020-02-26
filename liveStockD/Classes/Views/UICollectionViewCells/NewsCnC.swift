//
//  NewsCnC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class NewsCnC: UICollectionViewCell {
    
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    func populateWithData(_ section: Int,_ news: NewsList){
        
        newsImg.layer.cornerRadius = 10
        
        self.newsTitle.text =  news.newslist[section].title

        NetworkManager.shared.getImage(from: "news/" + news.newslist[section].image) { (image) in
            DispatchQueue.main.async { [unowned self] in
                self.newsImg.image = image
            }
        }
    }
    
}
