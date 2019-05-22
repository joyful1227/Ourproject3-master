//
//  EvaluationShowVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/11.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class EvaluationShowVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return evaluations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "evaluationCell") as! EvaluationCell
        let evaluation = evaluations[indexPath.row]
        cell.lbcargoID.text = "商品編號"+String(evaluation.cargoID)
        cell.lbuserID.text = "會員帳號"+String(evaluation.userID)
        cell.lbEvaluation.text = evaluation.evaluation
        cell.ivImage!.image = evaluation.image
        
        switch evaluation.starnumber {
        case 4:
            cell.ivstar5.image = UIImage(named: "nostar")
        case 3:
            cell.ivstar5.image = UIImage(named: "nostar")
            cell.ivstar4.image = UIImage(named: "nostar")
        case 2:
            cell.ivstar5.image = UIImage(named: "nostar")
            cell.ivstar4.image = UIImage(named: "nostar")
            cell.ivstar3.image = UIImage(named: "nostar")
        case 1:
            cell.ivstar5.image = UIImage(named: "nostar")
            cell.ivstar4.image = UIImage(named: "nostar")
            cell.ivstar3.image = UIImage(named: "nostar")
            cell.ivstar2.image = UIImage(named: "nostar")
        default:
            break
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
