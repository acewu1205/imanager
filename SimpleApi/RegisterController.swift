//
//  RegisterController.swift
//  SimpleApi
//
//  Created by wuping on 16/11/15.
//  Copyright © 2016年 acewu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PKHUD

class RegisterController: UIViewController {

    
    @IBOutlet weak var tf_account: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func register(_ sender: Any) {
        if (tf_account.text!.isEmpty || tf_password.text!.isEmpty) {
            HUD.show(.label("用户名或密码不能为空"))
            HUD.hide(afterDelay: 1.5)
            return 
        }
        
        let params = [
            "username" : tf_account.text!,
            "password" : tf_password.text!
        ]
        HUD.show(.progress)
        Alamofire.request("http://localhost:3000/register", method: .post, parameters: params).responseData { (response) in
            HUD.hide()
            let json = JSON(data:response.data!)
            if (response.response?.statusCode == 200) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = TabBarController()
            }
            else if (response.response?.statusCode == 404) {
                HUD.flash(.label(json["message"].string), delay:1.5)
            }
        }
    }
    
    @IBAction func gotoLoginPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
