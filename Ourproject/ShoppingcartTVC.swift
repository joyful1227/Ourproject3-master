//
//  ShoppingcartTVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/9.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class ShoppingcartTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingcarts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "shoppingcartCell"
        
        /*如果捲動表格，表格一邊會增加一列儲存格，另一邊則會消失一列儲存格，消失的儲存格其實是被移出佇列(dequeue)，如果能重複使用消失儲存格，就能節省記憶體空間；而且可避免建立與釋放儲存格空間的動作，可以提升效能 */
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ShoppingcartCell
        
        let shoppingcart = shoppingcarts[indexPath.row]
        /*  UITableViewCell本身有textLabel, detailTextLabel, imageView屬性可以設定主標、副標文字與圖片 */
        cell.lbName?.text = shoppingcart.name
                let priceCurrency = NumberFormatter.localizedString(from: NSNumber(value: shoppingcart.price), number: .currency)
        cell.lbPrice?.text = priceCurrency
        cell.lbAmout?.text = "\(String(shoppingcart.amount))個"
                cell.ivImage?.image = shoppingcart.image
        cell.sAuout.value = Double(shoppingcart.amount)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // 左滑時顯示Edit按鈕
        let edit = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let shoppingcart = shoppingcarts[indexPath.row]
            let alert = UIAlertController(title: "更改數量", message: "要更改數量?", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.text = String(shoppingcart.amount)
                textField.placeholder = "數量"
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let update = UIAlertAction(title: "Update", style: .default) { (alerAction) in
                if let amount = Int(alert.textFields?[0].text ?? "") {
                    shoppingcart.amount = amount
                    
                    tableView.reloadData()
                } else {
                    // 點擊AlertAction後AlertController會消失，那就讓它再跳出來以顯示錯誤訊息
                    alert.message = "數量輸入錯誤!"
                    self.present(alert, animated: true, completion: nil)
                }
            }
            alert.addAction(cancel)
            alert.addAction(update)
            self.present(alert, animated: true, completion: nil)
        })
        edit.backgroundColor = UIColor.lightGray
        
        // 左滑時顯示Delete按鈕
        let delete = UITableViewRowAction(style: .destructive, title: "Delete", handler: { (action, indexPath) in
            shoppingcarts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        return [delete, edit]
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
