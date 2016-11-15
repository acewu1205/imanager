//
//  LoginController.swift
//  SimpleApi
//
//  Created by wuping on 16/11/14.
//  Copyright © 2016年 acewu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PKHUD

class LoginController: UIViewController {

    @IBOutlet weak var tf_account: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        if (tf_account.text!.isEmpty || tf_password.text!.isEmpty) {
            HUD.show(.label("用户名或密码不能为空"))
            HUD.hide(afterDelay: 1.5)
            return
        }
        
        let params : Parameters = [
            "username":tf_account.text!,
            "password":tf_password.text!
        ]
        HUD.show(.progress)
        Alamofire.request("http://localhost:3000/login", method: .post, parameters: params).responseData { (response) in
            HUD.hide()
            if (response.response?.statusCode == 200) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = TabBarController()
            }
            else {
                HUD.flash(.error, delay:1.0)
            }
        }
    }
    
    @IBAction func gotoRegisterPage(_ sender: Any) {
        present(RegisterController(), animated: true, completion: nil)
    }
    
    
}
