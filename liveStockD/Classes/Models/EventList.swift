//
//  EventList.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import Foundation

struct EventList: Codable{
    let eventlist: [EventItem]
}

struct EventItem: Codable{
    let id: String
    let image: String
    let title: String
    let address: String
}
