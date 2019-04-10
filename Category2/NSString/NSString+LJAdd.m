//
//  NSString+LJAdd.m
//  LJCategories
//
//  Created by zhaozhuangxin on 2016/11/9.
//  Copyright © 2016年 zhaozhuangxin. All rights reserved.
//

#import "NSString+LJAdd.h"
#import "NSScanner+LJAdd.h"

@implementation NSString (LJAdd)

/**
 判断该实例是否为手机号码
 1. 是否是11位
 2. 是否都是数字
 
 @return YES 是 NO 否
 */
-(BOOL) isMobilePhone{
    if (self.length != 11) return NO;
    NSScanner* scan = [NSScanner scannerWithString:self];
    int counter = 0;
    return [scan scanIntOnly:&counter];
    
}


@end
