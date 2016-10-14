//
//  CSMyFileListViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/14.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CSMyFileListViewController: CSTabelViewController {

    var cellModels : [AnyObject] = []
    var cellInfos = [
    
        [
            "title": "关于 JavaScript.doc",
            "imageUrl": "",
            "fileSize": "34.5K",
            "form": "hfjdfksdl;"
        ],
        [
            "title": "关于 JavaScript.doc",
            "imageUrl": "",
            "fileSize": "34.5K",
            "form": "hfjdfksdl;"
        ],

        [
            "title": "关于 JavaScript.doc",
            "imageUrl": "",
            "fileSize": "34.5K",
            "form": "hfjdfksdl;"
        ],

        [
            "title": "关于 JavaScript.doc",
            "imageUrl": "",
            "fileSize": "34.5K",
            "form": "hfjdfksdl;"
        ],

        [
            "title": "关于 JavaScript.doc",
            "imageUrl": "",
            "fileSize": "34.5K",
            "form": "儿啊阿拉贡啊；骗人噶；爱人公安； 爱干净好aer0加二极管"
        ],

        [
            "title": "关于 JavaScript.doc",
            "imageUrl": "",
            "fileSize": "34.5K",
            "form": "日啊然后就挺好； "
        ],

        [
            "title": "关于 JavaScript.doc",
            "imageUrl": "",
            "fileSize": "34.5K",
            "form": "的黑客是够了人生"
        ],
  
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.cellModels = NSArray.yy_modelArrayWithClass(CSMyFileModel.self, json: self.cellInfos)!
        self.tableView.registerNibOf(CSMyFileCell)
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
extension CSMyFileListViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : CSMyFileCell = tableView.dequeueReusableCell()
        cell.configureWithModel(cellModels[indexPath.row] as! CSMyFileModel)
        return cell
    }
}
