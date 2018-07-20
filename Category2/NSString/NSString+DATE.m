//
//  NSString+DATE.m
//  SupplyChain
//
//  Created by Lucky.Liu on 2016/4/21.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "NSString+DATE.h"

@implementation NSString (DATE)

-(NSDate *)date{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    if (self.length == 19) {
        // yyyy-MM-dd HH:mm:ss length == 19
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else if (self.length == 16){
        // yyyy-MM-dd HH:mm length == 16
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }else if (self.length == 10){
        // yyyy-MM-dd length == 10
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return [dateFormatter dateFromString:self];
}

-(NSString *)date:(NSString *) dateStr getFormatterStr:(NSString *)formatterStr{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:formatterStr];
    return [dateFormatter stringFromDate:self.date];
}

-(NSString *)YYYYMMdd{
    return [self date:self getFormatterStr:@"YYYY-MM-dd"];
}

-(NSString *)MM$dd${
    return [self date:self getFormatterStr:@"MM月dd日"];
}

-(NSString *)MMYddH{
    return [self date:self getFormatterStr:@"MM月dd号"];
}

-(NSString *)MMdd{
    return [self date:self getFormatterStr:@"MM-dd"];
}

-(NSString *) EE{
    return [self date:self getFormatterStr:@"EE"];
}

-(NSString *)HHmm{
    return [self date:self getFormatterStr:@"HH:mm"];
}

-(NSString *)MMdd_HHmm{
    return [self date:self getFormatterStr:@"MM-dd HH:mm"];
}

-(NSString *)MM$dd$_HHmm{
    return [self date:self getFormatterStr:@"MM月dd日 HH:mm"];
}

-(double)intervalSinceNow{
    return [self.date timeIntervalSinceNow];
}

-(double)intervalSinceNowToDay{
    double days = self.intervalSinceNow / (60*60*24);
    return days;
}

@end
