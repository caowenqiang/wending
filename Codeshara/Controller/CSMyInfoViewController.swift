//
//  CSMyInfoViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/14.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit

class CSMyInfoViewController: CSScrollerViewController {

    var displayController = YZDisplayViewController.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //封装展示多个子控制器
        
        
        configureVontrolls()
        self.contenInset = UIEdgeInsetsMake(64, 0, 49, 0)
        //设置 titleScrollView 样式
        self.configureTitleScroll()
        //设置上半部分的界面
        self.configureTopInfo()
    }
    func configureTopInfo(){
        let bakImage = UIImageView.init(image: UIImage.init(named: "背景图片"))
        self.contentView.addSubview(bakImage)
        bakImage.snp_makeConstraints { (make) in
            make.top.equalTo(16)
            make.left.right.equalTo(0)
            make.height.equalTo(140)
        }
        let headImage = UIImageView.init(image: UIImage.init(named:"头像"))
        bakImage.addSubview(headImage)
        headImage.snp_makeConstraints { (make) in
            make.left.top.equalTo(16)
            make.width.height.equalTo(56)
        }
        let nameLabel = UILabel.init()
        nameLabel.font = UIFont.systemFontOfSize(16)
        nameLabel.textColor = UIColor.whiteColor()

        bakImage.addSubview(nameLabel)
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(headImage.snp_right).offset(8)
            make.top.equalTo(headImage)
        }
        nameLabel.text = "大熊猫"
        
        let emailLabel = UILabel.init()
        emailLabel.font = UIFont.systemFontOfSize(15)
        emailLabel.textColor = UIColor.whiteColor()
        bakImage.addSubview(emailLabel)
        emailLabel.snp_makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.bottom.equalTo(headImage)
        }
        emailLabel.text = "10@.100.com"
        
        let setButton = UIButton.init(type: UIButtonType.Custom)
        setButton.setTitle("设置", forState: UIControlState.Normal)
        setButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        setButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        bakImage.addSubview(setButton)
        setButton.snp_makeConstraints { (make) in
            make.right.equalTo(-16)
            make.centerY.equalTo(0)
        }
 
        let btnArr = ["12\n我的分享","2\n我的下载","1\n我的好友"]
        var lastView : UIButton? = nil
        for btnTitle in btnArr{
            let button = UIButton.init(type: UIButtonType.Custom)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(15)
            button.jk_setBackgroundColor(UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.15 ), forState: UIControlState.Normal)
            button.setTitle(btnTitle, forState: UIControlState.Normal)
            button.titleLabel?.textAlignment = .Center
            button.titleLabel?.numberOfLines = 0
            bakImage.addSubview(button)
            
            button.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(lastView == nil ? bakImage.snp_left : (lastView?.snp_right)!).offset(lastView == nil ? 0 : 1)
                
                make.width.equalTo(bakImage).dividedBy(btnArr.count)
//                if lastView != nil{
//                    make.width.equalTo(lastView!)
//                    
//                }else{
//                    make.right.equalTo(0)
//                }
                make.height.equalTo(44)
                make.bottom.equalTo(0)
            })
            lastView = button
        }
    }

    func configureTitleScroll(){
        //下划线
        displayController.setUpUnderLineEffect { (isShowUnderLine, isDelayScroll, lineHeight, lineColor) in
            isShowUnderLine.memory = true
            lineColor.memory = UIColor ( red: 0.5708, green: 0.9, blue: 1.0, alpha: 1.0 )
            
        }
//        标题颜色效果
        displayController.setUpTitleGradient { (isShowTitleGradient, titleGradientStyle, startR, startG, startB, endR, endG, endB) in
            isShowTitleGradient.memory = true
            titleGradientStyle.memory = YZTitleColorGradientStyleFill
            startR.memory = 0.5
            startG.memory = 0.5
            startB.memory = 0.5
            endR.memory = 0.75
            endG.memory = 0.75
            endB.memory = 0.75
        }
        
    }
    func configureVontrolls(){
//        let displayController = YZDisplayViewController.init()
        let picList = CSMyPhotoListViewController.init(nibName: nil, bundle: nil)
        picList.title = "图片"
        
        displayController.addChildViewController(picList)
        
        let videoList = CSMyVideoListViewController.init(nibName: nil, bundle: nil)
        videoList.title = "视频"
        videoList.style = .Plain
        videoList.contenInset = UIEdgeInsetsMake(44, 0, 0, 0)
        displayController.addChildViewController(videoList)
        
        let fileList = CSMyFileListViewController.init(nibName: nil, bundle: nil)
        fileList.title = "压缩包"
        fileList.style = .Plain
        fileList.contenInset = UIEdgeInsetsMake(44, 0, 0, 0)
        displayController.addChildViewController(fileList)
        //将 displyViewController 加到本控制器上  并展示
        self.addChildViewController(displayController)
        self.contentView.addSubview(displayController.view)
        //配置控制器大小 让子控制器的 view 大小可以根据控制器的 view 改变而 改变
//        displayController.view.frame = self.view.bounds
//        displayController.view.autoresizingMask = [
//        UIViewAutoresizing.FlexibleHeight,
//        UIViewAutoresizing.FlexibleWidth
//        ]
        
        displayController.view.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(160)
        }
        displayController.view.backgroundColor = UIColor.whiteColor()
        
        //控制器的生命周期
        displayController.didMoveToParentViewController(self)
        
//        self.navigationItem.titleView = displayController.titleScrollView
    
        displayController.titleScrollView.backgroundColor = UIColor ( red: 1.0, green: 0.9281, blue: 0.9927, alpha: 0.43 )
        
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
