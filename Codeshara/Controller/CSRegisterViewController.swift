//
//  CSRegisterViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit
import Alamofire
class CSRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "注册"
        // Do any additional setup after loading the view.
        let username = UITextField.init()
        
        username.font = UIFont.systemFontOfSize(15)
        username.placeholder = "输入邮箱或手机号"
        username.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(username)
        username.snp_makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(48)
        }
         //设置输入框边框
        username.layer.borderColor = UIColor.lightGrayColor().CGColor
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
        //设置密码框
        password.secureTextEntry = true
        password.layer.borderColor = UIColor.lightGrayColor().CGColor
        password.layer.borderWidth = 1.0
        
        //验证码
        let  code = UITextField.init()
         code.placeholder = "请输入验证码"
         code.font = UIFont.systemFontOfSize(15)
         code.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(code)
        //设置约束
         code.snp_makeConstraints { (make) in
            make.top.equalTo(password.snp_bottom).offset(30)
            make.left.right.equalTo(0)
            make.height.equalTo(48)
            
        }
        //设置边框
        code.layer.borderColor = UIColor.lightGrayColor().CGColor
        code.layer.borderWidth = 1.0



        //设置输入框左边的图片
        let nameLeft = UIView.init()
        let passLeft = UIView.init()
        let codeLeft = UIView.init()
        
        let nameImage = UIImageView.init(image: UIImage.init(named: "手机邮箱图标"))
        nameLeft.addSubview(nameImage)
        username.leftView = nameLeft
        username.leftViewMode = UITextFieldViewMode.Always
        nameLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(64, 48))
        }
        nameImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        let passImage = UIImageView.init(image: UIImage.init(named: "新密码图标"))
        password.leftView = passLeft
        password.leftViewMode = UITextFieldViewMode.Always
        passLeft.addSubview(passImage)
        passLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(64, 48))
        }
        passImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        let codeImage = UIImageView.init(image: UIImage.init(named: "验证信息图标"))
        code.leftView = codeLeft
        code.leftViewMode = UITextFieldViewMode.Always
        codeLeft.addSubview(codeImage)
        codeLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(64, 48))
        }
        codeImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        //验证码输入框右边的按钮
        let codeRight = UIView.init()
        let codeBtn = UIButton.init(type: UIButtonType.Custom)
        codeBtn.titleLabel?.font = UIFont.systemFontOfSize(13)

        
        codeBtn.setTitle("获取验证信息", forState: UIControlState.Normal)
        codeBtn.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)

        codeBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
        codeBtn.layer.borderWidth = 1.0
        //设置视角的圆角
        codeBtn.layer.cornerRadius = 3.0
        //设置让背景颜色范围在视图范围内
        codeBtn.layer.masksToBounds = true
        codeBtn.jk_setBackgroundColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        codeBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
        codeBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: UIControlState.Highlighted)
        
        code.rightView = codeRight
        code.rightViewMode = UITextFieldViewMode.Always
        codeRight.snp_makeConstraints { (make) in
            make.height.equalTo(48)
            make.width.equalTo(120)
        }
        codeRight.addSubview(codeBtn)
        codeBtn.snp_makeConstraints { (make) in
            make.center.equalTo(0)
//            make.left.equalTo(8)
//            make.top.equalTo(4)
            make.right.equalTo(-8)
            make.top.equalTo(4)
        }
        
        
      
        //注册
        let registerBtn = UIButton.init(type: UIButtonType.Custom)
        registerBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        registerBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
       
        //        正常状态
        registerBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: .Normal)
        //        选中状态
        registerBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
        //        高亮状态
        registerBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: .Highlighted)
        
        self.view.addSubview(registerBtn)
        registerBtn.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(code.snp_bottom).offset(100)
             make.height.equalTo(48)
        }
        //        点击事件
        registerBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
            Alamofire.request(.POST,"https:www.1000phone.tk",parameters: ["service":"User.Register","phone":username.text!,"password":password.text!,"vwrificationCode":code.text!],encoding: ParameterEncoding.URLEncodedInURL,headers: nil).responseJSON(completionHandler: { (response) in
                if response.result.isSuccess{
                    print(response.result.value!)
                    self.navigationController?.popViewControllerAnimated(true)
                }else{
                   print("网络不个力哦")
                }
                
            })
        
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
