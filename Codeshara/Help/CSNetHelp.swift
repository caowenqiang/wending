//
//  CSNetHelp.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/13.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import UIKit
import Alamofire
public class CSNetHelp: NSObject {

    public class func request (
        method: Alamofire.Method = .POST,
        URLString: String = QFAppBaseURL,
        paremeters: [String: AnyObject],
        headers: [String: String]? = nil
        ) -> Alamofire.Request {
        return Alamofire.request(method, URLString, parameters: paremeters, encoding: .URL, headers: headers)
        
    }
}
extension Request {
    //封装
    func responseJSON(
        comletionhandler:(data: AnyObject,success: Bool) -> Void)
        -> Self {
        return responseJSON(completionHandler: { (response) in
            
            let result = response.result
            //声明需要会的两个参数
            var success = false
            var data : AnyObject = "网络有问题，请重试"
            
            if result.isSuccess{
                let serverData = result.value as! NSDictionary
                
                let serverRet = serverData["ret"] as! Int
                
                if serverRet != 200{  //请求出现问题
                    data = serverData["msg"]!
                }else{  //请求成功
                    let retValue = serverData["data"] as! NSDictionary
                    print(retValue)
                    let retCode = retValue["code"] as! Int
                    
                    if retCode == 0 {
                        success = true
                        data = retValue["data"]!
                    }else{
                        data = retValue["msg"]!
                    }
                    
                }
            }else{
                data = (result.error?.localizedDescription)!
            }
            //调用传入的回调闭包 ，如果成功就返回请求到的数据 如果失败
            comletionhandler(data: data, success: success)
        })
            
    }
}
