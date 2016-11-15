//
//  TabBarController.swift
//  SimpleApi
//
//  Created by wuping on 16/11/15.
//  Copyright © 2016年 acewu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        tabBar.barTintColor = UIColor.black
        tabBar.tintColor = UIColor.white
        
        self.addTabBarItem(childVC: MainController(), title:"主页", imageName: "tabbar_main", selectImageName:"tabbar_main_select")
        self.addTabBarItem(childVC: MeController(), title:"我", imageName: "tabbar_me", selectImageName:"tabbar_me_select")
    }
    
    func addTabBarItem(childVC:UIViewController, title:String, imageName:String, selectImageName:String) {
        
        let nav = UINavigationController.init(rootViewController: childVC)
        self.addChildViewController(nav)
        
        let originalImage = UIImage.init(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let originalSelectImage = UIImage.init(named: selectImageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        nav.tabBarItem.image = originalImage
        nav.tabBarItem.selectedImage = originalSelectImage
        childVC.title = title
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
