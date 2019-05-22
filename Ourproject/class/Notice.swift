//
//  Notice.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/7.
//  Copyright © 2019 sun. All rights reserved.
//

import Foundation
import UIKit
class Notice : Cargo {
    var ismessage : Bool
    var content : String!
//    var userID : Int!
    init(content : String, cargo:Cargo) {
        self.ismessage = true
        self.content = content
        super.init(cargoID: cargo.cargoID, name: cargo.name, price: cargo.price, image: cargo.image!)
    }
    init(cargo:Cargo) {
        self.ismessage = false
        super.init(cargoID: cargo.cargoID, name: cargo.name, price: cargo.price, image: cargo.image!)
    }
    
//    init(cargoID: Int , name: String, price: Int, image: UIImage, size : Size,title : String) {
//        super.init(cargoID: cargoID, name: name, price: price, image: image, size : size)
//    }
}
