//
//  NSObject+YYParse.m
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/3/2.
//  Copyright © 2016年 libin. All rights reserved.
//

#import "NSObject+YYParse.h"
#import <objc/runtime.h>
#import "NSObject+YYModel.h"

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

- (void)setValue:(nullable id)value forPrivateKey:(NSString *)key {
    Class cls = self.class;
    NSLog(@"ZXThreadVC time1: %@", self.description);
    
    unsigned int count = 0;
    Ivar *members = class_copyIvarList(cls, &count);
    for (int i = 0; i < count; i++) {
        Ivar var = members[i];
        //-----
        const char *varName = ivar_getName(var);
        const char *memberType = ivar_getTypeEncoding(var); //变量类型
        NSLog(@"memberName = %s ; type = %s ", varName ,memberType);
        //------
        NSString *str = [NSString stringWithUTF8String:ivar_getName(var)];
        if ([str hasPrefix:@"_"]) {
            str = [str substringFromIndex:1];
            if ([str hasPrefix:@"_"]) {
                str = [str substringFromIndex:1];
            }
        }
        if ([str isEqualToString:key]) {
            NSLog(@"包含了");
            [self setValue:value forKey:key];
            break;
        }
    }
}
 
- (id)performSelector:(SEL)aSelector
          withObjects:(NSArray *)arguments
{
    //    1,根据SEL实例化方法签名
    NSMethodSignature *signature = [self.class instanceMethodSignatureForSelector:aSelector];
    if (!signature) {
        NSLog(@"不存在该方法");
        return nil;
    } else {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.target = self;
        invocation.selector = aSelector;
        
        //获取参数个数，默认有self，_cmd参数
        NSInteger paramCount = signature.numberOfArguments - 2;
        NSInteger sum = MIN(paramCount, arguments.count);
        
        //设置方法参数
        for (NSInteger i = 0; i < sum; i++) {
            id argument = arguments[i];
            if ([argument isKindOfClass:[NSNull class]]) {
                continue;
            }
            [invocation setArgument:&argument atIndex:(2 + i)];
        }
        [invocation invoke];
        
        id returnValue = nil;
        if (signature.methodReturnLength) {
            [invocation getReturnValue:&returnValue];
        }
        return returnValue;
    }
}

@end
