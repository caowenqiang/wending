//
//  CSUserModel.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/13.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit
import YYModel

class CSUserModel: NSObject {

    //用户单例
    static var SharredUser = CSUserModel()
    private override init() {
        super.init()
        //取出沙盒内的数据 ，配置默认用户
        if let userInfo = NSUserDefaults.standardUserDefaults().objectForKey(String(self)) {
            self.yy_modelSetWithJSON(userInfo)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var address = ""
    var avatar = ""
    var birthday = ""
    var email = ""
    var gender = ""
    var id : String? = nil
    var name = ""
    var nickname = ""
    var phone = ""
    
    class func isLogin() -> Bool{
        return SharredUser.id != nil
    }
    //根据
    class func login(with UserInfo:[String:AnyObject])  {
    
//        SharredUser.setValuesForKeysWithDictionary(UserInfo)
        SharredUser.yy_modelSetWithDictionary(UserInfo)
        //将用户数据存在沙盒中
        NSUserDefaults.standardUserDefaults().setObject(SharredUser.yy_modelToJSONObject(), forKey: String(CSUserModel))
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}
