//
//  HJUploaderTool.swift
//  HJPrivateCenter
//
//  Created by HeJun on 31/07/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import UIKit

class HJUploaderTool: NSObject, GCDWebUploaderDelegate {
	static let sharedInstance = HJUploaderTool()
	var uploader: GCDWebUploader?
	
	func starWithDir(dir: String, port: UInt16, block: (_ serverPath: String)->Void) {
		self.uploader = GCDWebUploader.init(uploadDirectory: dir)
		self.uploader?.allowHiddenItems = true
		self.uploader?.delegate = self
		if (self.uploader?.start(withPort: UInt(port), bonjourName: nil))! {
			block((self.uploader?.serverURL?.absoluteString)!)
		}
	}
	func stop() {
		if (self.uploader?.isRunning)! {
			self.uploader?.stop()
		}
	}
	
	// MARK: - GCDWebUploaderDelegate
	func webUploader(_ uploader: GCDWebUploader!, didUploadFileAtPath path: String!) {
		printLog(message: "upload: " + path)
	}
	func webUploader(_ uploader: GCDWebUploader!, didDownloadFileAtPath path: String!) {
		printLog(message: "download: " + path)
	}
	func webUploader(_ uploader: GCDWebUploader!, didMoveItemFromPath fromPath: String!, toPath: String!) {
		printLog(message: "moved: " + fromPath + "toPath: " + toPath)
	}
	func webUploader(_ uploader: GCDWebUploader!, didCreateDirectoryAtPath path: String!) {
		printLog(message: "created: " + path)
	}
	func webUploader(_ uploader: GCDWebUploader!, didDeleteItemAtPath path: String!) {
		printLog(message: "deleted: " + path)
	}
}
