//
//  NSString+RWCustomConfiguration.h
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/3/13.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,RWAllotOrderState){
    allotOrderStateSubmited = 0,  //已提交
    allotOrderStateLessRepertory, //库存不足
    allotOrderStateWait,          //等待出库
    allotOrderStateOutStorage,   //已出库
    allotOrderStateInCompleted  //已完成
};

@interface NSString (RWCustomConfiguration)

+(NSString *)stringFromInt:(int)intValue;
+(NSString *)stringFromDouble:(double)doubleValue;
-(NSString *)getIntOrFloat2;
+(NSString *)stringWithoutCompany:(NSString*)shopName;
+(RWAllotOrderState)allotSataeFromString:(NSString*)state;

@property (nonatomic, readonly) NSString  *removeBlank;
@property (nonatomic, readonly) NSString *hiddenPhoneNum;
@property (nonatomic, readonly) NSString *rmIllegalStr;


-(NSString *)checkhOdooFaill;

@end
