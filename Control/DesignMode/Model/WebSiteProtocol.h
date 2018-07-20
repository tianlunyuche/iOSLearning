//
//  WebSiteProtocol.h
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol WebSiteProtocol <NSObject>

- (void)user:(User *)user;

@end
