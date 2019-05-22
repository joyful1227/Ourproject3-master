//
//  Shoppingcart.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/8.
//  Copyright © 2019 sun. All rights reserved.
//

import Foundation
import UIKit
class Shoppingcart{
    var name: String!
    var price: Int!
    var image: UIImage!
    var amount: Int!
    
    init(name: String, price: Int, image: UIImage,amout: Int) {
        self.name = name
        self.price = price
        self.image = image
        self.amount = amout
    }
}
