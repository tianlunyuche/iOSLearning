//
//  NSString+LJAdd.h
//  LJCategories
//
//  Created by 刘瑾 on 2016/11/9.
//  Copyright © 2016年 刘瑾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LJAdd)


/**
 判断该实例是否为手机号码
1. 是否是11位
 2. 是否都是数字
 
 @return YES 是 NO 否
 */
-(BOOL) isMobilePhone;

@end
