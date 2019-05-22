//
//  SearchVC2.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/8.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class SearchVC2: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cargos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cellId = "SearchCell2"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell2", for: indexPath) as! SearchCell2
        let cargo = cargos[indexPath.row]
        cell.ivCargo.image = cargo.image
        cell.lbName.text = cargo.name
        let priceCurrency = NumberFormatter.localizedString(from: NSNumber(value: cargo.price), number: .currency)
        cell.lbPrice.text = priceCurrency
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/2, height: 240)
    }

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

}
