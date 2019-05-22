//
//  ChatVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/12.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbcargoID: UILabel!
    @IBOutlet weak var lbShowchat: UILabel!
    @IBOutlet weak var tfChat: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

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
        
        notices.append(Notice(content : tfChat.text!,cargo: cargos[0]))
        lbShowchat.text! += tfChat.text!+"\n"
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
