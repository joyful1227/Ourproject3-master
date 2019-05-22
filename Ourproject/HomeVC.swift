//
//  HomeVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/7.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class HomeVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    var homeimages = [Homeimage]()
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return homeimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeimages[section].images.count
    }
    func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String,at indexPath: IndexPath) -> UICollectionReusableView{
        //        if kind == UICollectionView.elementKindSectionHeader{
        let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "homeCRV", for: indexPath) as! HomeCRV
        let homeimage = homeimages[indexPath.section]
        
        reusableview.lbtitle.text = homeimage.title
        reusableview.ivImage.animationImages = homeimage.animation
        let duration = Double(homeimage.animation.count)
        /* 設定動畫的總播放時間 */
        reusableview.ivImage.animationDuration = duration
        /* 設定播放次數。預設為0代表無限重複播放 */
        reusableview.ivImage.animationRepeatCount = 0
        reusableview.ivImage.startAnimating()
        return reusableview
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = "homeCVC"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCVC
        let homeimage = homeimages[indexPath.section].images[indexPath.row]
        cell.ivcargo?.image = homeimage
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 1
        cargos.append(Cargo(cargoID: 1 ,name: "商品1", price: 10000, image:UIImage(named: "test")!))
        cargos.append(Cargo(cargoID: 2 ,name: "商品2", price: 12000, image:UIImage(named: "girl")!))
        cargos.append(Cargo(cargoID: 3 ,name: "商品3", price: 11000, image:UIImage(named: "girl2")!))
        cargos.append(Cargo(cargoID: 4 ,name: "商品4", price: 14000, image:UIImage(named: "girl3")!))
        cargos.append(Cargo(cargoID: 5 ,name: "商品5", price: 15000, image:UIImage(named: "girl4")!))
        cargos.append(Cargo(cargoID: 6 ,name: "商品6", price: 16000, image:UIImage(named: "man1")!))
        cargos.append(Cargo(cargoID: 7 ,name: "商品7", price: 16000, image:UIImage(named: "man2")!))
        cargos.append(Cargo(cargoID: 8 ,name: "商品8", price: 16000, image:UIImage(named: "man3")!))
        cargos.append(Cargo(cargoID: 9 ,name: "商品9", price: 16000, image:UIImage(named: "man4")!))
        cargos.append(Cargo(cargoID: 10,name: "商品10", price: 16000, image:UIImage(named: "test")!))
        homeimages.append(Homeimage(title: "最新女裝", animation:[UIImage(named: "girllong1")!,UIImage(named: "girllong2")!,UIImage(named: "girllong3")!,UIImage(named: "girllong4")!], images: [UIImage(named: "girl")!,UIImage(named: "girl2")!,UIImage(named: "girl3")!,UIImage(named: "girl4")!]))
        homeimages.append(Homeimage(title: "最新男裝", animation:[UIImage(named: "manlong1")!,UIImage(named: "manlong2")!,UIImage(named: "manlong3")!,UIImage(named: "manlong4")!], images: [UIImage(named: "man1")!,UIImage(named: "man2")!,UIImage(named: "man3")!,UIImage(named: "man4")!]))
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
