//
//  SearchVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/7.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit

class SearchVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        sorts.append(Sort(name: "分類一",  image:UIImage(named: "girl")!))
        sorts.append(Sort(name: "分類二",  image:UIImage(named: "girl2")!))
        sorts.append(Sort(name: "分類三",  image:UIImage(named: "girl3")!))
        sorts.append(Sort(name: "分類四",  image:UIImage(named: "girl4")!))
        sorts.append(Sort(name: "分類五",  image:UIImage(named: "man1")!))
        sorts.append(Sort(name: "分類六",  image:UIImage(named: "man2")!))
        sorts.append(Sort(name: "分類七",  image:UIImage(named: "man3")!))
        sorts.append(Sort(name: "分類八",  image:UIImage(named: "man4")!))
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sorts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = "SearchCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        let sort = sorts[indexPath.row]
        cell.ivSort?.image = sort.image
        cell.lbsort.text = sort.name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: 240)
    }
}
