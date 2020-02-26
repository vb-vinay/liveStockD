//
//  NewsTbC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class NewsTbC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var news: NewsList?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func populateWithData(_ news: NewsList){
        self.news = news
        self.collectionView.reloadData()
    }
}
extension NewsTbC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: NewsCnC = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCnC", for: indexPath) as? NewsCnC{
        
            if self.news != nil{
                cell.populateWithData(indexPath.item, self.news!)
            }
        
        return cell
        
        }
        return UICollectionViewCell()
    }
    
    
}
