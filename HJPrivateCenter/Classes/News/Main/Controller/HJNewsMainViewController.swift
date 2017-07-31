//
//  HJNewsMainViewController.swift
//  HJPrivateCenter
//
//  Created by HeJun on 31/07/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import UIKit
import SnapKit

class HJNewsMainViewController: HJBaseViewController, UITableViewDelegate, UITableViewDataSource {

	var dataList: [Int]!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.configureUploader()
		self.setupViews()
//		UIApplication.shared.statusBarStyle = .lightContent
//		let statusBarWindow: UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
//		let statusBar: UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
//		if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
//			statusBar.backgroundColor = UIColor.red
//		}
		
		
//		UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - configure uploader
	func configureUploader() -> Void {
		let uploaderTool = HJUploaderTool.sharedInstance
		
		let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
		
		uploaderTool.starWithDir(dir: dir!, port: 8080) { (serverPath) in
			printLog(message: "start : " + serverPath)
		}
	}
	// MARK: - initView
	func setupViews() -> Void {
		let tableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
		tableView.delegate = self
		tableView.dataSource = self
		self.view.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.left.right.equalTo(self.view)
			make.top.equalTo(self.view).offset(64)
			make.bottom.equalTo(self.view).offset(-49)
		}
		tableView.backgroundColor = UIColor.blue
	}
	
	// MARK: - UITableViewDelegate
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if (self.dataList != nil) {
			return (self.dataList?.count)!
		} else {
			return 0
		}
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: UITableViewCell.self))
		
		if cell == nil {
			cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: String.init(describing: UITableViewCell.self))
		}
		cell?.textLabel?.text = "title"
		cell?.detailTextLabel?.text = "description: \(indexPath.row)"
		return cell!
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
