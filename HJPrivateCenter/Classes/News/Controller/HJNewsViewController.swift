//
//  HJHomeViewController.swift
//  HJPrivateCenter
//
//  Created by HeJun<mail@hejun.org> on 24/02/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import UIKit

class HJNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	var tableView : UITableView? = nil
	
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	/** init views */
	func setupViews() -> Void {
		self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: (UIScreen.main.bounds.width), height: (UIScreen.main.bounds.height)), style: UITableViewStyle.plain)
		self.tableView?.delegate = self;
		self.tableView?.dataSource = self;
		self.view.addSubview(self.tableView!)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(self.classForCoder))
		if cell == nil {
			cell = HJNewsTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: NSStringFromClass(self.classForCoder))
		}
		
		return cell!
		
	}

}
