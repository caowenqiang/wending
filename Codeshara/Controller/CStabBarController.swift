//
//  CStabBarController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CStabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureViewControllers()
    }
    
    func configureViewControllers(){
        let vcInfos = [["title":"主页","image":"按钮主页","class":"Codeshara.ViewController"],["title":"消息","image":"按钮消息","class":"Codeshara.ViewController"],["title":"分享","image":"按钮分享","class":"Codeshara.ViewController"],["title":"我的","image":"按钮我的","class":"Codeshara.CSMyVideoListViewController"]]
        var vcArr : [UINavigationController] = []
        for vcInfo in vcInfos{
    
            let vc = (NSClassFromString(vcInfo["class"]!) as! UIViewController.Type).init()
            
            vc.title = vcInfo["title"]
            
            let navVC = UINavigationController.init(rootViewController: vc)
            vcArr.append(navVC)
        }
        self.viewControllers = vcArr
        //设置taBar的图片
        var i = 0
        for tabBarItem in self.tabBar.items! {
            tabBarItem.image = UIImage.init(named: vcInfos[i]["image"]!)
            i = i + 1
        }
        //设置选中状态下 tabBar 的颜色
        self.tabBar.tintColor = UIColor ( red: 0.5725, green: 0.7961, blue: 0.2549, alpha: 1.0 )
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if CSUserModel.isLogin() == false{
            let loginVC = UINavigationController.init(rootViewController: CSLoginViewController.init())
            loginVC.view.backgroundColor = UIColor.whiteColor()
            self.presentViewController(loginVC, animated: true, completion: nil)
        }
        
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
