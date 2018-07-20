//
//  NSScanner+LJAdd.m
//  LJCategories
//
//  Created by 刘瑾 on 2016/11/9.
//  Copyright © 2016年 刘瑾. All rights reserved.
//

#import "NSScanner+LJAdd.h"

@implementation NSScanner (LJAdd)

/**
 扫描字符串是否只包含Int
 
 @param result 扫描的个数
 @return YES 是 NO 否
 */
-(BOOL) scanIntOnly:(nullable int *)result{
    return[self scanInt:result] && [self isAtEnd];
}

/**
 扫描字符串是否只包含整数或字母
 
 @param intResult 整数个数
 @param letterResult 字母个数
 @return YES 是 NO 否
 */
-(BOOL) scanInt:(nullable int *)intResult orLetter:(nullable int *)letterResult{
    NSUInteger strLength = self.string.length;
    
    //数字条件
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    //符合数字条件的有几个字节
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:self.string options:NSMatchingReportProgress range:NSMakeRange(0, strLength)];
    
    //英文字条件
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    //符合英文字条件的有几个字节
    NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:self.string options:NSMatchingReportProgress range:NSMakeRange(0, strLength)];
    
    if (tNumMatchCount == strLength) {
        //全部符合数字，表示沒有英文
        return YES;
        
    } else if (tLetterMatchCount == strLength) {
        //全部符合英文，表示沒有数字
        return YES;
        
    } else if (tNumMatchCount + tLetterMatchCount == strLength) {
        //符合英文和符合数字条件的相加等于密码长度
        return YES;
        
    } else {
        return NO;
        //可能包含标点符号的情況，或是包含非英文的文字，这里再依照需求详细判断想呈现的错误
    }
    
}

@end
