//
//  Homeimage.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/13.
//  Copyright © 2019 sun. All rights reserved.
//

import Foundation
import UIKit
class Homeimage {
    var title: String!
    var animation = [UIImage]()
    var images = [UIImage]()
    
    init(title: String , animation : [UIImage] , images: [UIImage]) {
        self.title = title
        self.animation = animation
        self.images = images
    }
    
}
