//
//  EventTbC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class EventTbC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var events: EventList?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func populateWithData(_ events: EventList){
        self.events = events
        self.collectionView.reloadData()
    }
}
extension EventTbC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: EventCnC = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCnC", for: indexPath) as? EventCnC{
        
            if self.events != nil{
                cell.populateWithData(indexPath.item, self.events!)
            }
        
        return cell
        
        }
        return UICollectionViewCell()
    }
    
    
}
