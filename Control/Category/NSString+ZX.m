//
//  NSString+ZX.m
//  Control
//
//  Created by xinying on 2016/11/15.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "NSString+ZX.h"
#import "NSScanner+ZX.h"

@implementation NSString (ZX)

//---------MD5加密
-(NSString *)md5String{
    
    const char *str =self.UTF8String;
    UTF8Char buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

-(NSString *)sha1String{
    
    const char *str =self.UTF8String;
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

-(NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length{
    
    NSMutableString *strM =[NSMutableString string];
    for (int i=0; i <length; i++) {
        [strM appendFormat:@"%02x",bytes[i]];
    }
    return [strM copy];
}

#pragma mark -手机号检测
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
