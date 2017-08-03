//
//  GlobalDefinition.swift
//  HJPrivateCenter
//
//  Created by HeJun on 31/07/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import Foundation
import UIKit

func HJLog<T>(message: T,
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

func HJRGBA(red r: CGFloat, green g: CGFloat, blue b:CGFloat, alpha a:CGFloat) -> UIColor {
	return UIColor.init(red: (r / 255.0), green: (g / 255.0), blue: (b / 255.0), alpha: (a))
}
func HJRGB(red r: CGFloat, green g: CGFloat, blue b:CGFloat) -> UIColor {
	return HJRGBA(red: (r), green: (g), blue: (b), alpha: 1.0)
}
