//
//  CSLoginViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit
//Masonry
//SnapKit
import SnapKit
import JKCategories
import Alamofire
class CSLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "登录"
        self.view.backgroundColor = UIColor.whiteColor()
        let username = UITextField.init()
    
        username.placeholder = "输入邮箱或密码"
        username.font = UIFont.systemFontOfSize(15)
        username.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(username)
        //设置约束  必须能唯一确定视图的位置和大小
        username.snp_makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(48)
        }
        //设置输入框边框
        username.layer.borderColor = UIColor.grayColor().CGColor
        username.layer.borderWidth = 1.0
        
        let password = UITextField.init()
        password.placeholder = "输入密码"
        password.font = UIFont.systemFontOfSize(15)
        password.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(password)
        //设置约束
        password.snp_makeConstraints { (make) in
            make.top.equalTo(username.snp_bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(48)
            
        }
        password.layer.borderColor = UIColor.grayColor().CGColor
        password.layer.borderWidth = 1.0
        
        //设置输入框左边的图片
        let nameLeft = UIView.init()
        let passLeft = UIView.init()
        let nameImage = UIImageView.init(image: UIImage.init(named: "用户图标"))
        nameLeft.addSubview(nameImage)
        username.leftView = nameLeft
        username.leftViewMode = UITextFieldViewMode.Always
        nameLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(64, 48))
        }
        nameImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        let passImage = UIImageView.init(image: UIImage.init(named: "密码图标"))
        password.leftView = passLeft
        password.leftViewMode = UITextFieldViewMode.Always
        passLeft.addSubview(passImage)
        passLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(64, 48))
        }
        passImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        //设置密码框
        password.secureTextEntry = true
        
        //忘记密码按钮
        let forgetPass = UIButton.init(type: UIButtonType.Custom)
        forgetPass.titleLabel?.font = UIFont.systemFontOfSize(15)
        forgetPass.setTitle("忘记密码?", forState: UIControlState.Normal)
        forgetPass.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        self.view.addSubview(forgetPass)
        forgetPass.snp_makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(password.snp_bottom)
            make.width.equalTo(72)
            make.height.equalTo(56)
        }
        //登录密码
        let login = UIButton.init(type: UIButtonType.Custom)
        login.titleLabel?.font = UIFont.systemFontOfSize(15)
        login.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        login.setTitle("登录", forState: UIControlState.Normal)
//        login.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.1, alpha: 1)
//        login.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, forState: <#T##UIControlState#>)
//        正常状态
        login.jk_setBackgroundColor(UIColor.greenColor(), forState: .Normal)
//        选中状态
        login.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
//        高亮状态
        login.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: .Highlighted)
//        点击事件 
        login.jk_handleControlEvents(.TouchUpInside) { (sender) in
            
            Alamofire.request(.POST,"https:www.1000phone.tk",parameters: ["service":"User.Register","phone":username.text!,"password":password.text!],encoding: ParameterEncoding.URLEncodedInURL,headers: nil).responseJSON(completionHandler: { (response) in
                if response.result.isSuccess{
                    print("ewge")
                    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                }else{
                    print("网络不个力哦")
                }
                
            })
            

        }
       
        
        self.view.addSubview(login)
        login.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(forgetPass.snp_bottom).offset(100)
            make.height.equalTo(48)
        }
        //导航条上的按钮
        //返回按钮
        let backBtn = UIButton.init(type: UIButtonType.Custom)
        backBtn.setImage(UIImage.init(named: "返回按钮"), forState: UIControlState.Normal)
//        将Button转换为UIBarButtonItem类型
        let backBarBtn = UIBarButtonItem.init(customView: backBtn)
        self.navigationItem.leftBarButtonItem = backBarBtn
        backBtn.frame = CGRectMake(0, 0, 24, 32)
         backBtn.addTarget(self, action: #selector(self.back), forControlEvents: UIControlEvents.TouchUpInside)
        //注册按钮
        let registerBtn = UIButton.init(type: UIButtonType.Custom)
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
        registerBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        //        将Button转换为UIBarButtonItem类型
        let registerBarBtn = UIBarButtonItem.init(customView: registerBtn)
        self.navigationItem.rightBarButtonItem = registerBarBtn
        registerBtn.frame = CGRectMake(0, 0, 44, 32)
       
        registerBtn.addTarget(self, action: #selector(self.register), forControlEvents: UIControlEvents.TouchUpInside)
       
    }
    func back(){
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    func register(){
        self.navigationController?.pushViewController(CSRegisterViewController.init(), animated: true)
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
