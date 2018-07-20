//
//  NSScanner+LJAdd.h
//  LJCategories
//
//  Created by 刘瑾 on 2016/11/9.
//  Copyright © 2016年 刘瑾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSScanner (LJAdd)

/**
 扫描字符串是否只包含Int

 @param result 扫描的个数
 @return YES 是 NO 否
 */
-(BOOL) scanIntOnly:(nullable int *)result;


/**
 扫描字符串是否只包含整数或字母

 @param intResult 整数个数
 @param letterResult 字母个数
 @return YES 是 NO 否
 */
-(BOOL) scanInt:(nullable int *)intResult orLetter:(nullable int *)letterResult;

@end
