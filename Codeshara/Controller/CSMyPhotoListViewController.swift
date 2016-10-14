//
//  CSMyPhotoListViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/14.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CSMyPhotoListViewController: ViewController {

    var collectionView : UICollectionView!
    //系统自带的流式布局
    var flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    var cellModels = [
          "图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片","图片","图片","图片","图片","图片","图片","图片","图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片", "图片",
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView = UICollectionView.init(frame: CGRectZero,collectionViewLayout: flowLayout)
        self.view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        flowLayout.itemSize = CGSizeMake(60, 60)
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        collectionView.delegate = self
        collectionView.dataSource = self
  
        collectionView.registerClassOf(CSMyPhotoCell)
        self.view.backgroundColor = UIColor ( red: 0.902, green: 0.902, blue: 0.902, alpha: 1.0 )
        
        collectionView.backgroundColor = UIColor ( red: 0.902, green: 0.902, blue: 0.902, alpha: 1.0 )
        
        collectionView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(44, 0, 0, 0)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CSMyPhotoListViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : CSMyPhotoCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }

}
