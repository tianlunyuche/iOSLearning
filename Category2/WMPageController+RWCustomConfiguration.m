//
//  WMPageController+RWCustomConfiguration.m
//  SupplyChain
//
//  Created by 刘瑾 on 2016/12/30.
//  Copyright © 2016年 libin. All rights reserved.
//

#import "WMPageController+RWCustomConfiguration.h"

@implementation WMPageController (RWCustomConfiguration)

-(void)setupRWConfigurationInLoadView{
    
    self.menuHeight = 40.0f;
    self.menuViewStyle = WMMenuViewStyleLine;
    
    self.progressColor = [UIColor colorWithHex:@"4BB400"];
    self.titleColorSelected = [UIColor colorWithHex:@"6BB400"];
    self.titleColorNormal = [UIColor colorIsNormalOfPageMenu];
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    self.menuBGColor = [UIColor whiteColor];
    self.progressHeight = 2;
    self.progressViewIsNaughty = YES;
    self.menuView.speedFactor = 5;
    self.pageAnimatable = YES;
    self.automaticallyCalculatesItemWidths = YES;
    self.scrollEnable = NO;
}

-(void)setupRWConfigurationInViewDidLoad{
    
}

-(void)setupRWConfigurationInViewWillAppear{
    
}

-(void)showSeparatorLine{
    if (!self.menuView) return;
    UIView *sView = [UIView new];
    sView.tag = 11708;
    [self.menuView addSubview:sView];
    [sView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.height.equalTo(.5);
    }];
    sView.backgroundColor = [UIColor colorWithHex:@"dfdfdf"];
}

-(void)hiddenSeparatorLine{
    UIView *view = [self.menuView viewWithTag:11708];
    if (view) {
        [view removeFromSuperview];
    }
}

@end
