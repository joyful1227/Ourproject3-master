//
//  Order.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/11.
//  Copyright © 2019 sun. All rights reserved.
//

import Foundation
import UIKit
class Order:Cargo{
    var isarrived :Bool
    var userID : Int
    init(cargoID : Int,name: String, price: Int, image: UIImage,userID : Int, size : Size) {
        self.userID = userID
        self.isarrived = true
        super.init(cargoID: cargoID, name: name, price: price, image: image, size : size)
    }
}
