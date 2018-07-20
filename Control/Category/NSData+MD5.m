//
//  NSData+MD5.m
//  Control
//
//  Created by xinying on 2016/11/15.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "NSData+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (MD5)

-(NSString *)getMD5Data{
    
    //1,创建MD5对象
    CC_MD5_CTX md5;
    //2,初始化MD5
    CC_MD5_Init(&md5);
    //3，准备MD加密
    CC_MD5_Update(&md5, self.bytes, (CC_LONG)self.length);
    //4，准备一个字符串数组，储存MD5加密后的数据
    UTF8Char result[CC_MD5_DIGEST_LENGTH];
    //5，结束MD5加密
    CC_MD5_Final(result, &md5);
    
    NSMutableString *resultStr =[NSMutableString string];
    //6，从result数组中获取最终结果
    for (int i =0; i <CC_MD5_DIGEST_LENGTH; i++) {
        [resultStr appendFormat:@"%02X",result[i]];
    }
    return resultStr;
}


@end
