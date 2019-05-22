//
//  EvaluationVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/11.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit
import CoreMotion

class EvaluationVC: UIViewController {
    @IBOutlet weak var ivcargoImage: UIImageView!
    
    @IBOutlet weak var ivstar5: UIImageView!
    @IBOutlet weak var ivstar4: UIImageView!
    @IBOutlet weak var ivstar3: UIImageView!
    @IBOutlet weak var ivstar2: UIImageView!
    @IBOutlet weak var tfEvaluation: UITextView!
    var motionManager: CMMotionManager?
    var count = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        if motionManager == nil {
            motionManager = CMMotionManager()
        }
        // 檢查Accelerometer是否可用
        if motionManager!.isAccelerometerAvailable {
            motionManager!.accelerometerUpdateInterval = 1
            let queue = OperationQueue()
            motionManager!.startAccelerometerUpdates(to: queue, withHandler: { (data, error) in
                if error == nil && data != nil {
                    if data!.acceleration.x > 0.3 {
                        if(self.count >= 5){
                            return
                        }
                        self.count += 1
                    }
                    if data!.acceleration.x < -0.3 {
                        if(self.count <= 1){
                            return
                        }
                        self.count -= 1
                    }
                    //                    message = String(format: "Accelerometer:\nX = %.2f\nY = %.2f\nZ = %.2f", data!.acceleration.x, data!.acceleration.y, data!.acceleration.z)
                } else {
                    //                    message = error!.localizedDescription
                    self.motionManager!.stopAccelerometerUpdates()
                }
                /* UI元件的控制必須在主執行緒上，否則無法運作 */
                DispatchQueue.main.async(execute: {
                    switch self.count {
                    case 1:
                        self.ivstar2.image = UIImage(named: "nostar")
                    case 2:
                        self.ivstar3.image = UIImage(named: "nostar")
                        self.ivstar2.image = UIImage(named: "mystar")
                    case 3:
                        self.ivstar4.image = UIImage(named: "nostar")
                        self.ivstar3.image = UIImage(named: "mystar")
                    case 4:
                        self.ivstar5.image = UIImage(named: "nostar")
                        self.ivstar4.image = UIImage(named: "mystar")
                    case 5:
                        self.ivstar5.image = UIImage(named: "mystar")
                    default:
                        break
                    }
                })
            })
        }
    }
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    @IBAction func clickSubmit(_ sender: UIButton) {
        let alertController = UIAlertController(title: "確認", message: "評價編輯完成？", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "確定", style: .default) { (alertAction) in
            if let evaluation = self.tfEvaluation.text {
                evaluations.append(Evaluation(cargoID: 1, userID: 1,starnumber : self.count ,image: UIImage(named: "test")! ,evaluation : evaluation))
            }
        }
        alertController.addAction(ok)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)//實作取消按鈕
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion:nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        motionManager?.stopAccelerometerUpdates()
    }
    
    @IBAction func touchView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
