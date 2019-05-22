//
//  OrderVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/11.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class OrderVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var count = 0
    var showorders = [Order]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbShow: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        orders.append(Order(cargoID: 1, name: "商品一", price: 1000, image: UIImage(named: "test")!, userID: 100, size: .S))
        orders.append(Order(cargoID: 2, name: "商品二", price: 1000, image: UIImage(named: "test")!, userID: 100, size: .S))
        orders.append(Order(cargoID: 3, name: "商品三", price: 1400, image: UIImage(named: "test")!, userID: 100, size: .S ))
        orders.append(Order(cargoID: 4, name: "商品四", price: 2000, image: UIImage(named: "test")!, userID: 100, size: .S))
        orders.append(Order(cargoID: 5, name: "商品五", price: 1050, image: UIImage(named: "test")!, userID: 100, size: .S))
        orders.append(Order(cargoID: 6, name: "商品六", price: 1500, image: UIImage(named: "test")!, userID: 100, size: .S))
        orders.append(Order(cargoID: 7, name: "商品七", price: 1040, image: UIImage(named: "test")!, userID: 100, size: .S))
        orders.append(Order(cargoID: 8, name: "商品八", price: 1200, image: UIImage(named: "test")!, userID: 100, size: .S))
        orders[2].isarrived = false
        orders[4].isarrived = false
        orders[7].isarrived = false
        for order in orders{
            if !order.isarrived{
                showorders.append(order)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedOrder(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        
        switch selectedSegmentIndex {
        case 0:
            lbShow.text = "請點擊掃描QRcode"
            showorders.removeAll()
            for order in orders{
                if !order.isarrived{
                    showorders.append(order)
                }
            }
        case 1:
            lbShow.text = "請點擊編輯評價"
            showorders.removeAll()
            for order in orders{
                if order.isarrived{
                    showorders.append(order)
                }
            }
        default:
            break
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showorders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as! OrderCell
        let order = showorders[indexPath.row]
        cell.lbcargoName!.text = order.name
        cell.lbcargoID.text = String(order.cargoID)
        cell.ivImage!.image = order.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if showorders[indexPath.row].isarrived {
            let evaluationVC = self.storyboard?.instantiateViewController(withIdentifier: "evaluationVC") as! EvaluationVC
            self.navigationController?.pushViewController(evaluationVC, animated: true)
        }else{
            let useQRcodeVC = self.storyboard?.instantiateViewController(withIdentifier: "useQRcodeVC") as! UseQRcodeVC
            self.navigationController?.pushViewController(useQRcodeVC, animated: true)
        }
    }
    //        self.performSegue(withIdentifier: "EvaluationVC", sender: self)
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "evaluationVC" {
//            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
//            let showorder = showorders[indexPath!.row]
//            let evaluationVC = segue.destination as! EvaluationVC
//        }
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
