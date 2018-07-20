//
//  NSString+Regex.m
//  xsj_users
//
//  Created by D-C-L on 10/25/16.
//  Copyright © 2016 WJ. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString(CH)

+ (BOOL)validateData:(NSString *)dataString
{
    NSString* data = @"yyyy-MM-dd HH:mm:ss";
    NSPredicate *dataPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",data];
    return [dataPre evaluateWithObject:dataString];
}

+ (NSString *)changeValidateDataTo:(NSString *)dataString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString *)changeValidateDataTo1:(NSString *)dataString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString *)changeValidateDataTo2:(NSString *)dataString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString *)changeValidateDataTo3:(NSString *)dataString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString *)changeValidateDataTo4:(NSString *)dataString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString *)changeValidateDataTo5:(NSString *)dataString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:@"MM月dd号"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (BOOL)dateValidateIsToDayDataTo:(NSString *)dataString {
    NSDate *thisDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *Today = [dateFormatter stringFromDate:thisDate];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *checkDate = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *checkDay = [dateFormatter stringFromDate:checkDate];
    if ([Today isEqualToString:checkDay]) {
        return YES;
    }else {
        return NO;
    }
}

+ (NSString *)getMDHMString:(NSString *)dateStr
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    if ([NSString dateValidateIsToDayDataTo:dateStr]) {
        [dateFormatter setDateFormat:@"HH:mm"];
    } else
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)dateValidateToday {
    NSDate *thisDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *Today = [dateFormatter stringFromDate:thisDate];
    return Today;
}

+ (NSString *)dateValidateToday1 {
    NSDate *thisDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *Today = [dateFormatter stringFromDate:thisDate];
    return Today;
}

+ (BOOL)validatePhoneNumber:(NSString *)phoneNumber
{
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phoneNumber];
}

+ (NSString *)ValidateDate:(NSString *)dataString formatterTo:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dataString];
    [dateFormatter setDateFormat:formatter];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

- (NSArray<NSString *> *)handleDeadDate
{
    
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit =NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay;
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    
    // 设置日期格式（声明字符串里面每个数字和单词的含义）
    fmt.dateFormat =@"yyyy-MM-dd HH:mm:ss";
    
    // 微博的创建日期
    NSDate *createDate = [fmt dateFromString:self];
    NSDateComponents *cmp0 = [calendar components:unit fromDate:createDate];
    createDate = [calendar dateFromComponents:cmp0];
    
    // 当前时间
    NSDate *now = [NSDate date];
    cmp0 = [calendar components:unit fromDate:now];
    now = [calendar dateFromComponents:cmp0];
    
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:createDate toDate:now options:0];
    
    if (cmps.year > 0 || cmps.month > 0 || cmps.day > 0) {
        return @[@"已过期"];
    } else if (cmps.day == 0) {
        return @[@"今天过期"];
    } else {
        return @[@(labs(cmps.day)), @"天到期"];
    }
    
    return nil;
}

@end
