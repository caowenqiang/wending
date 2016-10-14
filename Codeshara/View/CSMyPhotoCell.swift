//
//  CSPhotoCell.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/14.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CSMyPhotoCell: UICollectionViewCell {
    
    var mask = UIView.init()
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        let imageView = UIImageView.init(image: UIImage.init(named:"图片"))
        self.contentView.addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        self.contentView.addSubview(mask)
        mask.backgroundColor = UIColor ( red: 0.1292, green: 0.1699, blue: 0.1449, alpha: 0.25 )
        mask.alpha = 0
        
        mask.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    override var highlighted: Bool{
        didSet{
            UIView.animateWithDuration(0.25) { 
                self.mask.alpha =  CGFloat(self.highlighted)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
