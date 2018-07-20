//
//  WebSiteFactory.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "WebSiteFactory.h"
#import "ConcreteWebSite.h"

@implementation WebSiteFactory

- (instancetype)init{
    
    self  =[super init];
    if (self) {
        _flyweights =[NSDictionary dictionary];
    }
    return self;
}

- (id<WebSiteProtocol>)getWebSiteCategory:(NSString *)webKey{
    
    __block id<WebSiteProtocol> webset =nil;
    [self.flyweights enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (webKey ==key) {
            webset =obj;
            *stop =YES;
        }
    }];
    
    if (webset ==nil) {
        ConcreteWebSite *concreteWebset =[[ConcreteWebSite alloc] init];
        concreteWebset.webName =webKey;
        webset =concreteWebset;
        //将不可变字典self.flyweights 转成可变后，添加键值对 后 再 变成不可变的NSDictionary
        NSMutableDictionary *mutabledic =[NSMutableDictionary dictionaryWithDictionary:self.flyweights];
        [mutabledic setObject:webset forKey:webKey];
        self.flyweights =[NSDictionary dictionaryWithDictionary:mutabledic];
    }
    
    return webset;
}

- (NSInteger)getWebSiteCount{
    
    return self.flyweights.count;
}

@end
