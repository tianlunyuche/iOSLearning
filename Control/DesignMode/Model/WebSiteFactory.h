//
//  WebSiteFactory.h
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebSiteProtocol.h"

//享元：工厂类，维护池中的享元对象
@interface WebSiteFactory : NSObject

@property(nonatomic,strong)NSDictionary *flyweights;//享元对象


//getWebSiteCategory方法可以返回具体的享元对象，返回的这个享元对象同时遵守WebSiteProtocol的协议
- (id<WebSiteProtocol>)getWebSiteCategory:(NSString *)webKey;
//获取网站数量
- (NSInteger)getWebSiteCount;
   
@end
