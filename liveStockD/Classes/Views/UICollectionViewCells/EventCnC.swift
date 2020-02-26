//
//  EventCnC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class EventCnC: UICollectionViewCell {
    
    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    
    func populateWithData(_ section: Int,_ event: EventList){
        
        eventImg.layer.cornerRadius = 10
        
        self.eventTitle.text = event.eventlist[section].title
        
        NetworkManager.shared.getImage(from: "events/" + event.eventlist[section].image) { (image) in
            DispatchQueue.main.async { [unowned self] in
                self.eventImg.image = image
            }
        }
    }
}
