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
		
		let newsVc = HJNewsViewController()
		newsVc.title = "新闻"
		newsVc.tabBarItem.image = UIImage.init(named: "tabbar_icon_news_normal")
		newsVc.tabBarItem.selectedImage = UIImage.init(named: "tabbar_icon_news_highlight")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
		let navHome = HJNavigationController(rootViewController: newsVc)
		
		let meVc = HJMeViewController()
		meVc.title = "我"
		meVc.tabBarItem.image = UIImage.init(named: "tabbar_icon_me_normal")
		meVc.tabBarItem.selectedImage = UIImage.init(named: "tabbar_icon_me_highlight")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
		let navMe = HJNavigationController(rootViewController: meVc)
		
		self.addChildViewController(navHome)
		self.addChildViewController(navMe)
	}

}
