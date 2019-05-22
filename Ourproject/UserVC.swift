//
//  ViewController.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/5.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class UserVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var ivPicture: UIImageView!
    @IBOutlet weak var lbShow: UILabel!
    @IBOutlet weak var tfuserID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func clickPicture(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let pickpic = UIAlertAction(title: "相簿", style: .default) { (alertAction) in
            let imagePicker = UIImagePickerController()
            /* 將UIImagePickerControllerDelegate、UINavigationControllerDelegate物件指派給UIImagePickerController */
            imagePicker.delegate = self
            /* 照片來源為相簿 */
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        let takepic = UIAlertAction(title: "拍照", style:.default) { (alertAction) in
            let imagePicker = UIImagePickerController()
            /* 將UIImagePickerControllerDelegate、UINavigationControllerDelegate物件指派給UIImagePickerController */
            imagePicker.delegate = self
            /* 照片來源為相機 */
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        alertController.addAction(pickpic)
        alertController.addAction(takepic)
        self.present(alertController, animated: true, completion:nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        /* 利用指定的key從info dictionary取出照片 */
        if let pickedImage = info[.originalImage] as? UIImage {
            ivPicture.image = pickedImage
            UIImageWriteToSavedPhotosAlbum(pickedImage, nil, nil, nil)
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickSubmit(_ sender: UIButton) {
        let alertController = UIAlertController(title: "確認", message: "註冊完成？", preferredStyle: .alert)
        let ok = UIAlertAction(title: "確定", style: .default) { (alertAction) in
            if self.tfuserID.text == "" {
                self.lbShow.text = "註冊失敗!!"
            }else{
                let alertController = UIAlertController(title: nil, message: "註冊成功", preferredStyle: .alert)
                self.present(alertController, animated: true, completion:nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                    self.performSegue(withIdentifier: "HomepageVC", sender: self)
                }
            }
        }
        alertController.addAction(ok)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)//實作取消按鈕
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion:nil)
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

