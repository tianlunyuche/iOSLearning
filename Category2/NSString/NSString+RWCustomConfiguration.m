//
//  NSString+RWCustomConfiguration.m
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/3/13.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "NSString+RWCustomConfiguration.h"

@implementation NSString (RWCustomConfiguration)

+(NSString *)stringFromInt:(int)intValue{
    return [NSString stringWithFormat:@"%d", intValue];
}

+(NSString *)stringFromDouble:(double)doubleValue{
    return [NSString stringWithFormat:@"%.2f", doubleValue];
}

+(NSString *)stringWithoutCompany:(NSString*)shopName
{
    NSRange range = [shopName rangeOfString:@" "];
    if (range.location == NSNotFound) {
        return shopName;
    }
    NSString *subString = [shopName substringWithRange:NSMakeRange(range.location, shopName.length - range.location)];
//    NSLog(@"subString = %@",subString);
    return subString;
}

+(RWAllotOrderState)allotSataeFromString:(NSString*)state
{
    if ([state isEqualToString:@"已提交"]) {
        return allotOrderStateSubmited;
    }
    if ([state isEqualToString:@"库存不足"]) {
        return allotOrderStateLessRepertory;
    }
    if ([state isEqualToString:@"待出库"]) {
        return allotOrderStateWait;
    }
    if ([state isEqualToString:@"已出库"]) {
        return allotOrderStateOutStorage;
    }
    if ([state isEqualToString:@"已完成"]) {
        return allotOrderStateInCompleted;
    }
    return allotOrderStateSubmited;
}

-(NSString *)hiddenPhoneNum{
    if (self.length != 11) {
        return nil;
    }
    return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
}

-(NSString *)rmIllegalStr{
    NSString *temp = self;
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"\r"];
    temp = [[temp componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    return temp;
    
}

-(NSString *)removeBlank{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/**
 与 整数部分比较，如果相同，则取整，否则保留2位小数

 @return 返回整或2为小数
 */
-(NSString *)getIntOrFloat2{
    
      return (self.intValue == self.floatValue) ? [NSString stringWithFormat:@"%d",self.intValue] : [NSString stringWithFormat:@"%.2f",self.floatValue];
}


-(NSString *)checkhOdooFaill{
    if (self.length != 0) {
        return self;
    }
    return @"发生未知错误";
}

@end
