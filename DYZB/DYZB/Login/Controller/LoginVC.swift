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

class LoginVC: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    let disposeBag: DisposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    @IBAction func loginAction(_ sender: Any) {
        print("\(self.accountLabel.text) + \(self.passwordLabel.text)")
    }
}
