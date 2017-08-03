//
//  HJTabbarViewController.swift
//  HJPrivateCenter
//
//  Created by HeJun<mail@hejun.org> on 23/02/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import UIKit

class HJTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabbar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func setupTabbar() -> Void {
		
		let newsVc = HJNewsMainViewController()
		newsVc.title = "新闻"
		let navHome = HJNavigationController.init(rootViewController: newsVc)
		
		let fileVc = HJFileMainViewController()
		fileVc.title = "文件";
		let navFile = HJNavigationController.init(rootViewController: fileVc)
		
		let meVc = HJMeMainViewController()
		meVc.title = "我"
		let navMe = HJNavigationController.init(rootViewController: meVc)
		
		self.addChildViewController(navHome)
		self.addChildViewController(navFile)
		self.addChildViewController(navMe)
		
		let tabbarImages = ["tab_ic_recent", "tab_ic_file", "tab_ic_my"];
		
		var index = 0
		for vc in self.childViewControllers {
			
			let selectedImage = tabbarImages[index] + "_selected"
			vc.tabBarItem.image = UIImage.init(named: tabbarImages[index])
			vc.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
			vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.gray], for: .normal)
			vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : HJRGB(red: 4, green: 164, blue: 255)], for: .selected)
			vc.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -3)
			
			index += 1
		}
		
	}

}
