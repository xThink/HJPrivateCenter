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
	var fileList: Array<(String, String, NSDate, Bool)>?
	
	typealias fileChanged = (((Array<(fileName: String, filePath: String, createDate: NSDate, isDir: Bool)>)?)->(Void))
	var fileChanged: fileChanged?
	
	func starWithDir(dir: String, port: UInt16, block: (_ serverPath: String?)->Void, fileChanged: fileChanged?) {
		self.uploader = GCDWebUploader.init(uploadDirectory: dir)
		self.uploader?.allowHiddenItems = true
		self.uploader?.delegate = self
		self.fileChanged = fileChanged
		if (self.uploader?.start(withPort: UInt(port), bonjourName: nil))! {
			block((self.uploader?.serverURL?.absoluteString)!)
			
			self.fileList = self.getFileList(filesDir: (self.uploader?.uploadDirectory)!)
			self.fileChanged?(self.fileList!)
			
			return
		}
		block(nil)
	}
	func stop() {
		if (self.uploader?.isRunning)! {
			self.uploader?.stop()
		}
	}
	
	// MARK: - GCDWebUploaderDelegate
	func webUploader(_ uploader: GCDWebUploader!, didUploadFileAtPath path: String!) {
		HJLog(message: "upload: " + path)
		let fm = FileManager.default
		let dirEnumer: FileManager.DirectoryEnumerator = fm.enumerator(atPath: uploader.uploadDirectory)!
		HJLog(message: dirEnumer)
		
	}
	func webUploader(_ uploader: GCDWebUploader!, didDownloadFileAtPath path: String!) {
		HJLog(message: "download: " + path)
		self.fileList = self.getFileList(filesDir: (self.uploader?.uploadDirectory)!)
		self.fileChanged?(self.fileList!)
	}
	func webUploader(_ uploader: GCDWebUploader!, didMoveItemFromPath fromPath: String!, toPath: String!) {
		HJLog(message: "moved: " + fromPath + "toPath: " + toPath)
		self.fileList = self.getFileList(filesDir: (self.uploader?.uploadDirectory)!)
		self.fileChanged?(self.fileList!)
	}
	func webUploader(_ uploader: GCDWebUploader!, didCreateDirectoryAtPath path: String!) {
		HJLog(message: "created: " + path)
		self.fileList = self.getFileList(filesDir: (self.uploader?.uploadDirectory)!)
		self.fileChanged?(self.fileList!)
	}
	func webUploader(_ uploader: GCDWebUploader!, didDeleteItemAtPath path: String!) {
		HJLog(message: "deleted: " + path)
		self.fileList = self.getFileList(filesDir: (self.uploader?.uploadDirectory)!)
		self.fileChanged?(self.fileList!)
	}
	
	// MARK: - getFileList
	func getFileList(filesDir dir: String) -> Array<(String, String, NSDate, Bool)> {
		let fileList = FileManager.default.enumerator(atPath: dir)
		
		var fileArray = Array<(String, String, NSDate, Bool)>()
		for fileName in fileList! {
			let filePath = dir + "/" + String.init(describing: fileName)
			do {
				let fileAttr = try FileManager.default.attributesOfItem(atPath: filePath)
				let fileType = fileAttr[FileAttributeKey.type]
				
				let fileTypeName = String.init(describing: fileType)
				let isDir = (fileTypeName == String.init(describing: FileAttributeType.typeDirectory)) ? true : false
				
				let fileCreateDate = fileAttr[FileAttributeKey.creationDate]
				if fileCreateDate is NSDate {
					fileArray.append((fileName as! String, filePath, fileCreateDate as! NSDate, isDir))
				}
			} catch {
				
			}
			
		}
		fileArray.sort(by: { (file1: (fileName: String, filePath: String, createDate: NSDate, isDir: Bool), file2: (fileName: String, filePath: String, createDate: NSDate, isDir: Bool)) -> Bool in
			return true
		})
		return fileArray
		
	}
}
