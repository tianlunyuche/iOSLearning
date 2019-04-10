//
//  NSObject+YYParse.h
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/3/2.
//  Copyright © 2016年 libin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface NSObject (YYParse)<YYModel>

+(id )parse:(id)json;
- (void)setValue:(nullable id)value forPrivateKey:(NSString *)key;
- (id)performSelector:(SEL)aSelector
          withObjects:(NSArray *)arguments;

@end
