//
//  NSDate+STRING.m
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/5/2.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "NSDate+STRING.h"

@implementation NSDate (STRING)

-(NSString *) getDateFormatterString:(NSString *)dateformatter{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = dateformatter;
    return [dateFormatter stringFromDate:self];
}

-(NSString *)EE{
    return [self getDateFormatterString:@"EE"];
}

-(NSString *)MMdd{
    return [self getDateFormatterString:@"MM-dd"];
}

-(NSString *)HHmm{
    return [self getDateFormatterString:@"HH:mm"];
}

-(NSString *)yyyyMMdd_HHmmss{
    return [self getDateFormatterString:@"yyyy-MM-dd HH:mm:ss"];
}

-(NSString *)yyyyMMdd{
    return [self getDateFormatterString:@"yyyy-MM-dd"];
}

-(NSDate *)localDate{

    NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
    NSTimeInterval time = [zone secondsFromGMTForDate:self]; // 以秒为单位返回当前时间与系统格林尼治时间的差
    NSDate *localDate = [self dateByAddingTimeInterval:time];// 然后把差的时间加上,就是当前系统准确的时间
    return localDate;
}

@end
