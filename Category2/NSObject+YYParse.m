//
//  NSObject+YYParse.m
//  SupplyChain
//
//  Created by 刘瑾 on 2016/3/2.
//  Copyright © 2016年 libin. All rights reserved.
//

#import "NSObject+YYParse.h"

@implementation NSObject (YYParse)

+ (id)parse:(id)json{
    if ([json isKindOfClass:[NSArray class]]) {
        //参数1:数组中的元素类型
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    if ([json isKindOfClass:[NSDictionary class]]) {
        //YYModel提供的JSON字典转 类对象的方法
        return [self modelWithJSON:json];
    }
    return json;
}



@end
