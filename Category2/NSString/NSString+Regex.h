//
//  NSString+Regex.h
//  xsj_users
//
//  Created by D-C-L on 10/25/16.
//  Copyright © 2016 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(CH)

//yyyy-MM-dd HH:mm:ss 的正则表达式检测
+ (BOOL)validateData:(NSString *)dataString;

//yyyy-MM-dd HH:mm:ss 转  MM月dd日 HH:mm
+ (NSString*)changeValidateDataTo:(NSString *)dataString;
//yyyy-MM-dd HH:mm:ss 转  HH:mm
+ (NSString*)changeValidateDataTo1:(NSString *)dataString;
//yyyy-MM-dd HH:mm:ss 转  yyyy-MM-dd
+ (NSString*)changeValidateDataTo2:(NSString *)dataString;
//yyyy-MM-dd HH:mm:ss 转  yyyy年MM月dd日
+ (NSString*)changeValidateDataTo3:(NSString *)dataString;
//yyyy-MM-dd HH:mm:ss 转  yyyy-MM-dd HH:mm
+ (NSString*)changeValidateDataTo4:(NSString *)dataString;
//yyyy-MM-dd HH:mm:ss 转  MM月dd号
+ (NSString *)changeValidateDataTo5:(NSString *)dataString;
//是不是今天
+ (BOOL)dateValidateIsToDayDataTo:(NSString *)dataString;

// IF TODAY RETUN 12:30 ELSE RETURN 01-31 12:30
+(NSString *)getMDHMString:(NSString *)dateStr;

//今天
+ (NSString *)dateValidateToday;
//今天  yyyy-MM-dd HH:mm
+ (NSString *)dateValidateToday1;


//手机号码的正则表达式检测
+ (BOOL)validatePhoneNumber:(NSString *)phoneNumber;

+ (NSString *)ValidateDate:(NSString *)dataString formatterTo:(NSString *)formatter;

/**
 处理到期时间

 @return @[@(3), @"天到期"] OR @[@"今天到期"]
 */
- (NSArray<NSString *> *)handleDeadDate;

@end
