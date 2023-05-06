//
//  MainTabBarController.swift
//  OpenQuizz
//
//  Created by Lilian MAGALHAES on 2023-03-26.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.changeToTabGame(_:)), name:  NSNotification.Name(rawValue: "goToMainTabBar"),object: nil)
    }
    
    @objc func changeToTabGame(_ notification: NSNotification)  {
        self.selectedIndex = 1
        if let name = notification.userInfo?["name"] as? String {
            let navVC = self.viewControllers![1] as! UINavigationController
            if let welcomeVC = navVC.topViewController as? WelcomeViewController {
                welcomeVC.name = name
            }
            
        }
}
    
}
