//
//  LoginVC.swift
//  DYZB
//
//  Created by 梁新昌 on 2019/10/21.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON


class LoginVC: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    let disposeBag: DisposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "home_mobilegameSuspendedView_dismiss_unpressed"), style: .plain, target: self, action: #selector(backAction))
      self.accountTextField.rx.text.orEmpty.subscribe(onNext: { (account) in
            if self.passwordTextField.text!.count > 0 {
                self.loginBtn.isEnabled = true
            } else {
                self.loginBtn.isEnabled = false
            }
            
        }).disposed(by: disposeBag)
        
        
        self.passwordTextField.rx.text.orEmpty.subscribe(onNext: { (password) in
            
            if self.accountTextField.text!.count > 0 {
                self.loginBtn.isEnabled = true
            } else {
                self.loginBtn.isEnabled = false
            }
            
            }).disposed(by: disposeBag)
        
        self.accountTextField.rx.text.bind(to: self.accountLabel.rx.text)
        self.passwordTextField.rx.text.bind(to: self.passwordLabel.rx.text)
        

    }

    
    @objc func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        let urlStr = "http://rap2api.taobao.org/app/mock/236311/appLogin"
        let parameters:Parameters = ["account": self.accountTextField.text!, "password": self.passwordTextField.text!]
        
        
        
        Alamofire.request(urlStr, method: .post, parameters: parameters, encoding: JSONEncoding.default)
        .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            
        }
        .validate { request, response, data in
            
            return .success
        }
        .responseJSON { response in
           switch response.result{
            
           case .success:
            
            if let json = response.result.value {
                
                
                debugPrint(JSON(json)["status"])
                
                if JSON(json)["status"] == 200 {
//                    NotificationCenter.default.rx.notification(Notification.Name(rawValue: "loginActionSuccess"), object: nil)
                    
                    self.backAction()
                    
                    
                }
            }
                
           case .failure(let error):
               print(error)
           }
        }
                
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.accountTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
}
