//
//  Cargo.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/7.
//  Copyright © 2019 sun. All rights reserved.
//

import Foundation
import UIKit
class Cargo {
    var cargoID : Int
    var name: String!
    var price: Int!
    var image: UIImage!
    var size: Size!
    
    init(cargoID : Int,name: String, price: Int, image: UIImage) {
        self.name = name
        self.price = price
        self.image = image
        self.cargoID = cargoID
    }
    init(cargoID : Int,name: String, price: Int, image: UIImage ,size: Size) {
        self.name = name
        self.price = price
        self.image = image
        self.cargoID = cargoID
        self.size = size
    }
    convenience init(){
        self.init(cargoID : 1,name: "商品名稱", price: 0, image: UIImage(named: "test")!,size : .S)
    }
}
