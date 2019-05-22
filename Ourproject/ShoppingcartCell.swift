//
//  ShoppingcartCell.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/9.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class ShoppingcartCell: UITableViewCell {

    @IBOutlet weak var sAuout: UIStepper!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbAmout: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    @IBAction func clickAmout(_ sender: UIStepper) {
        lbAmout.text = "\(Int(sender.value))個"
    }
}
