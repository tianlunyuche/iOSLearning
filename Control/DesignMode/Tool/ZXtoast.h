//
//  ZXtoast.h
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface ZXtoast : NSObject

@property(nonatomic,strong)MBProgressHUD*   HUD;

+ (ZXtoast *)shareInstance;

- (void)tipview:(NSString *)content currentview:(UIView *)view;

@end
