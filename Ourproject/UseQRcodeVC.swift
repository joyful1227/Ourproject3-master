//
//  UseQRcodeVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/11.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit
import AVFoundation

class UseQRcodeVC: UIViewController , AVCaptureMetadataOutputObjectsDelegate {

    var captureSession: AVCaptureSession!
    // 預覽畫面
    var previewLayer: AVCaptureVideoPreviewLayer!
    // 偵測到QR code時需要加框
    var qrFrameView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        startPreviewAndScanQR()
        // Do any additional setup after loading the view.
    }
    func startPreviewAndScanQR() {
        // 管理影像擷取期間的輸入與輸出
        captureSession = AVCaptureSession()
        // 負責擷取影像的預設裝置
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        // 建立輸入物件
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        if (captureSession.canAddInput(input)) {
            // 設定擷取期間的輸入
            captureSession.addInput(input)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            // 設定擷取期間的輸出
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            // 欲處理的類型為QR code
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        // 建立擷取期間所需顯示的預覽圖層
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(previewLayer)
        
        createQRFrame()
        preview(true)
    }
    
    // 建立QR code掃描框
    func createQRFrame() {
        qrFrameView = UIView()
        qrFrameView.layer.borderColor = UIColor.yellow.cgColor
        qrFrameView.layer.borderWidth = 3
        view.addSubview(qrFrameView)
        view.bringSubviewToFront(qrFrameView)
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // 將取得的資訊轉成條碼資訊
        if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            guard let qrString = metadataObject.stringValue else { return }
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            scanSuccess(qrCode: qrString)
            if let barCodeObject = previewLayer.transformedMetadataObject(for: metadataObject) {
                // 成功解析就將QR code圖片框起來
                qrFrameView.frame = barCodeObject.bounds
            }
        } else {
            // 無法轉成條碼資訊就將圖框隱藏
            qrFrameView.frame = CGRect.zero
        }
    }
    
    func scanSuccess(qrCode: String) {
        print(qrCode)
        // 停止預覽
        preview(false)
    }
    
    // 是否開啟預覽畫面
    func preview(_ yes: Bool) {
        if yes {
            // 讓QR code掃描框消失 (避免前一次QR code掃描框留在畫面上)
            qrFrameView.frame = CGRect.zero
            if (captureSession?.isRunning == false) {
                captureSession.startRunning()
            }
        } else {
            if (captureSession?.isRunning == true) {
                captureSession.stopRunning()
            }
        }
    }
    
    func failed() {
        let alert = UIAlertController(title: "Scanning not supported", message: "Please use a device with a camera.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = .portrait
        }
        preview(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = .all
        }
        preview(false)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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
