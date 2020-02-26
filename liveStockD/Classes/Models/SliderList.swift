//
//  SliderList.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import Foundation

struct SliderList: Codable{
    let sliderlist: [SliderItem]
}

struct SliderItem: Codable{
    let id: String
    let image: String
}
