//
//  ConcreteWebSite.h
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebSiteProtocol.h"

@interface ConcreteWebSite : NSObject<WebSiteProtocol>

@property(nonatomic,copy)NSString *webName;

@end
