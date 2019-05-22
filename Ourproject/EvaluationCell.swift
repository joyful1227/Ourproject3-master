//
//  EvaluationCell.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/12.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class EvaluationCell: UITableViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbuserID: UILabel!
    @IBOutlet weak var lbcargoID: UILabel!
    @IBOutlet weak var lbEvaluation: UILabel!
    
    @IBOutlet weak var ivstar5: UIImageView!
    @IBOutlet weak var ivstar4: UIImageView!
    @IBOutlet weak var ivstar3: UIImageView!
    @IBOutlet weak var ivstar2: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
