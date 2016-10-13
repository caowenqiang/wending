//
//  CSMyVidoListViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/13.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CSMyVideoListViewController: CSTabelViewController {

    //构造假数据
    var cellInfos : [[String: String]] = []
    //模拟数据模型
    var cellModels : [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib.init(nibName: String(CSMyVideoCell), bundle: nil), forCellReuseIdentifier: String(CSMyVideoCell))
        // Do any additional setup after loading the view.
        self.getData()
    }
    func getData(){
        cellInfos = [
        ["title":"杭州",
            "imageUrl":"视频",
            "videoUrl":"http://www.baidu.com"],
        ["title":"杭州",
            "imageUrl":"视频",
            "videoUrl":"http://www.baidu.com"],

        ["title":"杭州",
            "imageUrl":"视频",
            "videoUrl":"http://www.baidu.com"],

        ["title":"杭州",
            "imageUrl":"视频",
            "videoUrl":"http://www.baidu.com"],

        ["title":"杭州",
            "imageUrl":"视频",
            "videoUrl":"http://www.baidu.com"],

        ["title":"杭州",
            "imageUrl":"视频",
            "videoUrl":"http://www.baidu.com"],

        ]
        cellModels = NSArray.yy_modelArrayWithClass(CSMyVideoModel.self, json: cellInfos)!
        self.tableView.reloadData()
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
extension CSMyVideoListViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(CSMyVideoCell)) as! CSMyVideoCell
        cell.configure(withModel: cellModels[indexPath.row] as! CSMyVideoModel)
        return cell
        
    }
}
