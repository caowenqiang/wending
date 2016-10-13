//
//  CSRegisterViewController.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit
import Alamofire
import ReactiveCocoa
import JKCategories
//注册
class CSRegisterViewController: ViewController {

    dynamic var time = -1
    var timer : NSTimer!
    
//    var gg : Int?
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
//        codeBtn.enabled = false
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
            make.top.equalTo(code.snp_bottom).offset(200)
             make.height.equalTo(48)
        }
        codeBtn.enabled = false
        registerBtn.enabled = false
        
//        username.jk_handleControlEvents(UIControlEvents.EditingChanged) { (sender) in
//            //获取账号长度
//            code.enabled = username.text?.lengthOfBytesUsingEncoding(NSStringEncoding.init(NSUTF8StringEncoding)) == 11
//        }
//     用rac 订阅输入框的信号 根据输入内容 改变按钮状态 属性
        username.rac_textSignal().subscribeNext { (sender) in
            let name = sender as! NSString
            //决定按钮状态的条件 
            codeBtn.enabled = name.length == 11 && self.time == -1
            if name.length >= 11{
                password.becomeFirstResponder()
            }
        }
//        将几个信号合并为一个信号，订阅并改变按钮的状态（代替传值方式）
//        冷信号
        username.rac_textSignal()
        .combineLatestWith(password.rac_textSignal())
        .combineLatestWith(code.rac_textSignal())
        .subscribeNext { (sender) in
            print(sender)
            registerBtn.enabled = (username.text! as NSString).length == 11 && (password.text! as NSString).length >= 6 && (code.text! as NSString).length == 4
        }
//        用热信号的方法实现上面的需求
//        username.rac_textSignal().toSignalProducer()
//        .combineLatestWith(password.rac_textSignal().toSignalProducer())
//        .combineLatestWith(code.rac_textSignal().toSignalProducer())
//        .startWithNext { (singal1, signal2) in
//            print("signal1:\(singal1) signal2:\(signal2)")
//        }
        //也可以把按钮的点击事件当做信号来订阅
        registerBtn.rac_signalForControlEvents(UIControlEvents.TouchUpInside).subscribeNext { (sender) in
            print(sender as! UIButton)
        }
        //将变量的改变当做信号来订阅 (代替kvo)
//        self.rac_observeKeyPath("tine", observer: self) { (time) in
//            print()
//            
//        }
 
        self.rac_valuesForKeyPath("time", observer: self)
        .subscribeNext { (time) in
            codeBtn.enabled = self.time == -1
            
            if self.time == -1{
                if self.timer != nil{
                    self.timer.invalidate()
                    
                }
                codeBtn.setTitle("获取验证码", forState: UIControlState.Normal)
            }else{
                codeBtn.setTitle("还剩\(self.time)秒", forState: UIControlState.Normal)
            }
        }
        
//                按钮点击事件
        //获取验证码
        codeBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
            codeBtn.enabled = false
            //获取验证码方法
            self.time = 5
            SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethod.init(0), phoneNumber: username.text, zone: "86", customIdentifier: nil) { (error) in
//                if error != nil {
//                     print(error)
//                    codeBtn.enabled = true
//                }else{
//                  
//                    
                  self.timer =
                    NSTimer.jk_scheduledTimerWithTimeInterval(1.0, block: {
                            self.time = self.time - 1
                        }, repeats:true) as! NSTimer
                    
//                }
               
            }

        }
        

        //注册
        registerBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
//            Alamofire.request(.POST,"https:www.1000phone.tk",
//                parameters: ["service":"User.Register",
//                    "phone":username.text!,
//                    "password":(password.text! as NSString).jk_md5String,
//                    "verificationCode":code.text!],
//                encoding: ParameterEncoding.URLEncodedInURL,
//                headers: nil).responseJSON(completionHandler: { (response) in
//                if response.result.isSuccess{
//                    print(response.result.value!)
//                    self.navigationController?.popViewControllerAnimated(true)
//                }else{
//                   print("网络不个力哦")
//                }
//                
//            })
            CSNetHelp.request(paremeters:[
                "service":"User.Register",
                "phone":username.text!,
                "password":(password.text! as NSString).jk_md5String,
                "verificationCode": code.text!])
            .responseJSON({ (data, success) in
                if success{
                    self.navigationController?.popViewControllerAnimated(true)
                }else{
                    UIAlertView.init(title:"有错误", message: data as? String , delegate: nil, cancelButtonTitle: "我知道了").show()
                }
            })
        
        }
        //处理键盘遮挡视图的问题 (代替通知)
        NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil)
        .subscribeNext { (noti) in
            print(noti)
            let userInfo = (noti as! NSNotification).userInfo!
            let rect = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue
            print(rect.CGRectValue())
            //用 SnapKit 给注册按钮做一个动画
            //如果需要更改一个视图的约定
            registerBtn.snp_updateConstraints(closure: { (make) in
                make.top.equalTo(code.snp_bottom).offset(50)
            })
            UIView.animateWithDuration(0.25, animations: { 
                registerBtn.layoutIfNeeded()
            })
        }
        NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardWillHideNotification, object: nil)
        .subscribeNext { (noti) in
            registerBtn.snp_updateConstraints(closure: { (make) in
                make.top.equalTo(code.snp_bottom).offset(200)
            })
            UIView.animateWithDuration(0.25, animations: { 
                registerBtn.layoutIfNeeded()
            })
        }
    
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
