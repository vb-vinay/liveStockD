//
//  MagazineTbC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class MagazineTbC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var magazines: MagazineList?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func populateWithData(_ magazine: MagazineList){
        self.magazines = magazine
        collectionView.reloadData()
    }
}
extension MagazineTbC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: MagazineCnC = collectionView.dequeueReusableCell(withReuseIdentifier: "magazineCnC", for: indexPath) as? MagazineCnC{
        
            if self.magazines != nil{
                cell.populateWithData(indexPath.item, self.magazines!)
            }
        
        return cell
        
        }
        return UICollectionViewCell()
    }
}
