//
//  SliderTbC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class SliderTbC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var sliders: SliderList?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    func populateWithData(_ sliders: SliderList){
        self.sliders = sliders
        self.collectionView.reloadData()
    }
}

extension SliderTbC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: SliderCnC = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCnC", for: indexPath) as? SliderCnC{
        
            if self.sliders != nil{
                cell.populateWithData(self.sliders!)
            }
        
        return cell
        
        }
        return UICollectionViewCell()
    }
    
    
}
