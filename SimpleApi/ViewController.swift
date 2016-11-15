//
//  ViewController.swift
//  SimpleApi
//
//  Created by wuping on 16/11/14.
//  Copyright © 2016年 acewu. All rights reserved.
//

import UIKit
import SwiftyJSON
import SnapKit


class ViewController: UIViewController {

    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        box.backgroundColor = UIColor.red
        view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

