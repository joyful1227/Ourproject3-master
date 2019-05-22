//
//  UserUpdata.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/12.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class UserUpdata: UIViewController {

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
    @IBAction func clickSubmit(_ sender: UIButton) {
        let alertController = UIAlertController(title: "編輯到一半", message: "要回到上一頁嗎？", preferredStyle: .alert)
        let ok = UIAlertAction(title: "確定", style: .default) { (alertAction) in
            self.dismiss(animated: true, completion: nil)
            
        }
        alertController.addAction(ok)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)//實作取消按鈕
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion:nil)
        
    }
    
    @IBAction func clickUpdata(_ sender: UIButton) {
        let alertController = UIAlertController(title: "確認", message: "編輯完成嗎？", preferredStyle: .alert)
        let ok = UIAlertAction(title: "確定", style: .default) { (alertAction) in
            self.dismiss(animated: true, completion: nil)
            
        }
        alertController.addAction(ok)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)//實作取消按鈕
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion:nil)
    }
}
