//
//  CSMyFileCell.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/14.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CSMyFileCell: UITableViewCell {

    @IBOutlet weak var fileImage: UIImageView!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureWithModel(model:CSMyFileModel){
        title.text = model.title
        size.text = model.fileSize
        from.text = model.from
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
