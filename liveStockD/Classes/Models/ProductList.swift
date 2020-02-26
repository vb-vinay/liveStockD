//
//  ProductList.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import Foundation

struct ProductList: Codable{
    let productlist: [ProductItem]
}

struct ProductItem: Codable{
    let id: String
    let pic: String
    let title : String
    let quantity: String
    let price: String
    let content: String
}
