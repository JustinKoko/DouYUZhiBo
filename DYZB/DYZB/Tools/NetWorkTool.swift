//
//  NetWorkTool.swift
//  DYZB
//
//  Created by liangxinchang on 2019/11/21.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit
import Alamofire


enum MethodType {
    case GET
    case POST
}

class NetWorkTool {

    class func requestData(type:MethodType, urlString:String, parameters:[String:String]? = nil, header:[String:String]? = nil, _ finishCallBack: @escaping ((_ result: Any)->())) {
        
            let method = type == MethodType.GET ? HTTPMethod.get :HTTPMethod.post
        
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error)
                return
            }
            finishCallBack(result)
        }
                
    }
    
}
    

