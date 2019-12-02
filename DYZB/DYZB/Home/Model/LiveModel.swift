//
//  LiveModel.swift
//  DYZB
//
//  Created by liangxinchang on 2019/11/26.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit
import HandyJSON

class LiveModel: NSObject {
    
    
//    allnum = 531;
//    anchorLevel = 59;
//    familyName = "<null>";
//    flv = "http://pili-live-hdl.miaobolive.com/live/273cfc1f9e075a18269d458a94dc1540.flv";
//    isOnline = 0;
//    lianMaiStatus = 0;
//    new = 0;
//    nickname = "\U5973\U795e\U2728\U5c0f\U660e\U767d\U2728";
//    phonetype = 0;
//    photo = "http://liveimg.miaobolive.com/pic/avator/201904/11/13/C9E25FE41B5FBCD6_64288280_640.png";
//    position = "\U7ee5\U5316\U5e02";
//    roomid = 9158463;
//    serverid = 19;
//    sex = 0;
//    starlevel = 2;
//    useridx = 64288280;
    
    var isOnline : Int = 0
    var nickname : String = ""
    var photo : String = ""
    var flv : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        isOnline = dict["isOnline"] as! Int;
        nickname = dict["nickname"] as! String;
        photo = dict["photo"] as! String;
        flv = dict["flv"] as! String;
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
//    static func deserialize(from dict: [String : Any]?, designatedPath: String? = nil) -> LiveModel? {
//        let model = LiveModel()
//        model.nickname = dict?["nickname"] as! String
//        model.photo = dict?["photo"] as! String
//        model.flv = dict?["flv"] as! String
//        return model
//    }
//    class func jsonToModel(dic: AnyObject) -> LiveModel {
//        var model = LiveModel()
//        model.nickname = dic["nickname"] as! String
//        model.photo = dic["photo"] as! String
//        model.flv = dic["flv"] as! String
//        return model
//    }
    
    
}


