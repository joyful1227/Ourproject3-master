//
//  NoticeVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/13.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableview: UITableView!
    
    var noticesShow = [Notice]()
    override func viewDidLoad() {
        super.viewDidLoad()
        notices.append(Notice(cargo: cargos[0]))
        notices.append(Notice(cargo: cargos[1]))
        notices.append(Notice(cargo: cargos[2]))
        // Do any additional setup after loading the view.
        for notice in notices{
            if notice.ismessage{
                noticesShow.append(notice)
            }
        }
    }
    @IBAction func segmentNotice(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        
        switch selectedSegmentIndex {
        case 0:
            
            noticesShow.removeAll()
            for notice in notices{
                if notice.ismessage{
                    noticesShow.append(notice)
                }
            }
        case 1:
            noticesShow.removeAll()
            for notice in notices{
                if !notice.ismessage{
                    noticesShow.append(notice)
                }
            }
        default:
            break
        }
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticesShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noticeCell") as! NoticeCell
        let notice = noticesShow[indexPath.row]
        cell.lbcargoName.text = notice.name
        cell.lbcargoID.text = String(notice.cargoID)
        cell.ivImage.image = notice.image
        return cell
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
