//
//  NSString+DATE.h
//  SupplyChain
//
//  Created by Lucky.Liu on 2016/4/21.
//  Copyright © 2016年 Runwise. All rights reserved.
//

/*
 此文件是将默认时间格式的字符串转化成指定格式的时间格式字符串
 目前 支持 默认格式有 yyyy-MM-dd & yyyy-MM-dd HH:mm:ss & yyyy-MM-dd HH:mm
 
 $ 表示汉字 _ 表示空格 HHmm 连在一起表示默认格式 如：HHmm -> HH:mm 或者 MMdd -> MM-dd
 
 */

#import <Foundation/Foundation.h>

@interface NSString (DATE)

// -> YYYY-MM-dd
@property (nonatomic, readonly) NSString * YYYYMMdd;
// -> MM月dd日
@property (nonatomic, readonly) NSString * MM$dd$;
// -> MM月dd号
@property (nonatomic, readonly) NSString * MMYddH;
// -> MM-dd
@property (nonatomic, readonly) NSString * MMdd;
// -> MM-dd HH:mm
@property(nonatomic,readonly) NSString * MMdd_HHmm;
// -> MM月dd日 HH:mm
@property (nonatomic, readonly) NSString * MM$dd$_HHmm;
// -> HH:mm
@property (nonatomic, readonly) NSString * HHmm;
// -> EE
@property (nonatomic, readonly) NSString * EE;

// 转化为日期对象
@property (nonatomic, readonly) NSDate *date;

// 时间间隔
@property (nonatomic, readonly) double intervalSinceNow;
@property (nonatomic, readonly) double intervalSinceNowToDay;


@end
