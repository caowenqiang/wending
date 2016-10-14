//
//  ViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //设置不让系统控制 scrollView的 contentInsets
        self.automaticallyAdjustsScrollViewInsets = false
        //封装一个返回按钮
        self.configureBackItem()
        //设置 控制器的背景颜色
        self.view.backgroundColor = UIColor.randomColor()
    }

    func configureBackItem(){
        //如果是 push 的控制器，那么返回按钮响应的是 app， 否则是 dismiss
        if (self.navigationController?.presentingViewController == nil && self.navigationController?.viewControllers.first != self) ||
        self.navigationController?.presentingViewController != nil
        {
//            符合条件的都加上返回按钮
                let backBtn = UIButton.init(type: UIButtonType.Custom)
                backBtn.setImage(UIImage.init(named: "返回按钮"), forState: .Normal)
                backBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside, withBlock: { (sender) in
//                    判断如果 pop 不成功，就将导航控制器隐藏
                    if self.navigationController?.popViewControllerAnimated(true) == nil{
                        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                    }
                })
                backBtn.frame = CGRectMake(0, 0, 32, 32)
                let backItem = UIBarButtonItem.init(customView: backBtn)
                self.navigationItem.leftBarButtonItem = backItem
        }
        //只有不是present 出的导航控制器的第二个控制器，需要 添加这个属性
        if self.navigationController?.presentingViewController == nil && self.navigationController?.viewControllers.count >= 2 && self.navigationController?.viewControllers[2] == self {
            self.hidesBottomBarWhenPushed = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //在根控制器中写上公共代码
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
}
//封装一个分类 方便获取tabBar ，navigationBar , statusBar 等的高度
extension UIViewController{
    var statusBarHeight : CGFloat {
      return UIApplication.sharedApplication().statusBarFrame.size.height
    }
    var naviBarHeight: CGFloat {
        return (self.navigationController?.navigationBar.frame.size.height)!
    }
    var tabBarHeight: CGFloat{
        if self.navigationController?.presentingViewController == nil && self.navigationController?.viewControllers.first == self
        {
            return (self.tabBarController?.tabBar.frame.size.height)!
        }else{
            return 0
        }
    }
    var topBarHeight: CGFloat{
        if self.navigationController != nil{
            return statusBarHeight + naviBarHeight
         }
        else{
            
            return 0
        }
 
    }
}
