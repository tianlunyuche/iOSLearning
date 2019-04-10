//
//  NSArray+RWCustomConfiguration.m
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/1/10.
//  Copyright © 2016年 libin. All rights reserved.
//

#import "NSArray+RWCustomConfiguration.h"

#define ACCURACY(x) @"%.xf"

@implementation NSArray (RWCustomConfiguration)

//解决NSArray打印中文乱码问题
-(NSString *)descriptionWithLocale:(id)locale{
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"(\n"];
    
    for (id obj in self) {
        [strM appendFormat:@"\t%@,\n", obj];
    }
    [strM appendString:@")"];
    
    return strM;
}

-(NSArray *) reversedArray{
    return [[self reverseObjectEnumerator] allObjects];
}

@end
