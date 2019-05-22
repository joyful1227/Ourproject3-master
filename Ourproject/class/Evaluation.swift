//
//  Evaluation.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/11.
//  Copyright © 2019 sun. All rights reserved.
//

import Foundation
import UIKit
class Evaluation {
    var cargoID: Int!
    var userID: Int!
    var starnumber : Int!
    var image: UIImage!
    var evaluation : String!
    
    init(cargoID: Int, userID: Int,starnumber : Int ,image: UIImage ,evaluation : String) {
        self.cargoID = cargoID
        self.userID = userID
        self.starnumber = starnumber
        self.image = image
        self.evaluation = evaluation
    }
}
