//
//  NSString+ZX.h
//  Control
//
//  Created by xinying on 2016/11/15.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
//@constant kCCKeySizeAES128      128 bit AES key size.
//@constant kCCKeySizeAES192      192 bit AES key size.
//@constant kCCKeySizeAES256      256 bit AES key size.
//@constant kCCKeySizeDES         DES key size.
//@constant kCCKeySize3DES        Triple DES key size.
//@constant kCCKeySizeMinCAST     CAST minimum key size.
//@constant kCCKeySizeMaxCAST     CAST maximum key size.
//@constant kCCKeySizeMinRC4      RC4 minimum key size.
//@constant kCCKeySizeMaxRC4      RC4 maximum key size.
#import <CommonCrypto/CommonCrypto.h>


@interface NSString (ZX)

//---------MD5加密
-(NSString *)md5String;
//---------SHA1加密
-(NSString *)sha1String;

/**
 判断该实例是否为手机号码
 1. 是否是11位
 2. 是否都是数字
 
 @return YES 是 NO 否
 */
-(BOOL) isMobilePhone;



@end
