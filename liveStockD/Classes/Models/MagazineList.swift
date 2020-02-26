//
//  MagazineList.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import Foundation

struct MagazineList: Codable{
    let magazinelist: [MagazineItem]
}

struct MagazineItem: Codable{
    let id : String
    let pdf: String
    let title: String
    let description: String
}
