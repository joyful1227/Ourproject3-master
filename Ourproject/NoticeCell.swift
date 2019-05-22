//
//  NoticeCell.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/13.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class NoticeCell: UITableViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbcargoID: UILabel!
    @IBOutlet weak var lbcargoName: UILabel!
    @IBOutlet weak var lbcargoitem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
