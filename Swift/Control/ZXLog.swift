//
//  ZXLog.swift
//  Control
//
//  Created by 赵庄鑫 on 2018/8/1.
//  Copyright © 2018年 paohon. All rights reserved.
//

import Foundation

func printLog <T> (_ msg: T,
                file: String = #file,
                method: String = #function,
                line: Int = #line) {
    #if Debug
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(msg)")
    #endif
}
