//
//  CSTabelViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/13.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CSTabelViewController: ViewController {

    var style : UITableViewStyle = UITableViewStyle.Grouped
    init(WithStyle style: UITableViewStyle) {
        self.style = style
        super.init(nibName:nil,bundle:nil)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private(set) lazy var tableView:UITableView = {
        let style = self.style
        let tabelView = UITableView.init(frame: CGRectZero, style: style)
        tabelView.showsHorizontalScrollIndicator = false
        tabelView.backgroundColor = UIColor ( red: 0.687, green: 0.7188, blue: 1.0, alpha: 1.0 )
        tabelView.rowHeight = 64
        tabelView.tableFooterView = UIView()
        tabelView.delegate = self
        tabelView.dataSource = self
        
        
        return tabelView
    }()
    var contenInset = UIEdgeInsetsZero{
        didSet{
            tableView.contentInset = contenInset
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
//        设置 tableView 的约束， 等于 view 的大小
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        contenInset = UIEdgeInsetsMake(topBarHeight, 0, tabBarHeight, 0)
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
extension CSTabelViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
