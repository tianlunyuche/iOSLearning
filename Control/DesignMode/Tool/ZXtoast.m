//
//  ZXtoast.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXtoast.h"

@implementation ZXtoast
@synthesize HUD;

static ZXtoast *instance =nil; //存单例 对象的指针

//获取单例对象 的实现方法。，核心
+ (ZXtoast *)shareInstance{
    
    if(instance ==nil){
        instance =[[ZXtoast alloc] init];
    }
    
    return instance;
}

- (void)tipview:(NSString *)content currentview:(UIView *)view{
    
    self.HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:self.HUD];
    self.HUD.labelText = content;
    self.HUD.mode = MBProgressHUDModeText;
    
    //指定距离中心点的X轴和Y轴的位置，不指定则在屏幕中间显示
    self.HUD.yOffset = 200.0f;
    self.HUD.xOffset = 0.0f;
    
    [self.HUD showAnimated:YES whileExecutingBlock:^{
        sleep(3);
    } completionBlock:^{
        [self.HUD removeFromSuperview];
        self.HUD = nil;
    }];
}

@end
