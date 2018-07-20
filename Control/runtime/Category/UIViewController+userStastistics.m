//
//  UIViewController+userStastistics.m
//  Control
//
//  Created by xinying on 2016/12/2.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "UIViewController+userStastistics.h"
#import "ZXHookUtil.h"


@implementation UIViewController (userStastistics)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(swiz_viewWillAppear:);
        [ZXHookUtil swizzlingInClass:[self class] originSel:originalSelector swizzedSel:swizzledSelector];
        
        SEL originSel2 =@selector(viewWillDisappear:);
        SEL swizzledMethod2 =@selector(swiz_viewWillDisappear:);
        [ZXHookUtil swizzlingInClass:self.class originSel:originSel2 swizzedSel:swizzledMethod2];
    });
}

#pragma mark - Method Swizzling 黑魔法,页面统计
-(void)swiz_viewWillAppear:(BOOL)animated{

    //插入需要执行的代码
    [self inject_viewWillAppear];
    [self swiz_viewWillAppear:animated];
}

-(void)swiz_viewWillDisappear:(BOOL)animated{
    
    //插入需要执行的代码
    [self inject_viewWillDisappear];
    [self swiz_viewWillDisappear:animated];
}
    
//利用hook 统计所有页面的停留时长
- (void)inject_viewWillAppear
{
    NSString *pageID = [self pageEventID:YES];
    NSLog(@"hello %@",pageID);
    if (pageID) {
        //发送数据给服务器
    }
}
    
//利用hook 统计所有页面的停留时长
- (void)inject_viewWillDisappear
{
    NSString *pageID = [self pageEventID:NO];
    if (pageID) {
        //发送数据给服务器
    }
}
    
-(NSString *)pageEventID:(BOOL)bEnterPage{
    
    NSDictionary *configDic =[self dictFromPlist];
    NSString *selfClassName =NSStringFromClass(self.class);
    
    return configDic[selfClassName][@"PageEventIDs"][bEnterPage ? @"Enter":@"Leave"];
}

-(NSDictionary *)dictFromPlist{
    
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"userForVistingVCID" ofType:@"plist"];
    NSDictionary *dic =[NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return dic;
}
@end
