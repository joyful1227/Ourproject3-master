//
//  CargoShowVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/9.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class CargoShowVC: UIViewController {

    @IBOutlet weak var btMylove: UIButton!
    var cargo : Cargo!
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
    @IBAction func clickAddshoppingcart(_ sender: Any) {
        let alertController = UIAlertController(title: "確認", message: "確定加入購物車？", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "確定", style: .default) { (alertAction) in
            shoppingcarts.append(Shoppingcart(name:"衣服", price: 10000, image:UIImage(named: "test")!, amout: 1))
        }
        alertController.addAction(ok)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)//實作取消按鈕
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func clickMylove(_ sender: UIButton) {
        
        if btMylove.title(for: .normal) == "hearton"{
            btMylove.setTitle("heartoff", for: .normal)
            btMylove.setImage(UIImage(named: "Path 2"), for: .normal)
            myloves.append(Mylove(name: "商品", price: 1000, image: UIImage(named: "test")!))
            let alertController = UIAlertController(title: nil, message: "加入收藏", preferredStyle: .alert)
            present(alertController, animated: true, completion:nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
            
        }else{
            btMylove.setTitle("hearton", for: .normal)
            btMylove.setImage(UIImage(named: "Path 1"), for: .normal)
            myloves.removeLast()
            let alertController = UIAlertController(title: nil, message: "取消收藏", preferredStyle: .alert)
            present(alertController, animated: true, completion:nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
    }
}
