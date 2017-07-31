//
//  GlobalDefinition.swift
//  HJPrivateCenter
//
//  Created by HeJun on 31/07/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import Foundation

func printLog<T>(message: T,
              logError: Bool = false,
              file: String = #file,
              method: String = #function,
              line: Int = #line) {
	if logError {
		print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
	} else {
		#if DEBUG
			print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
		#endif
	}
}
