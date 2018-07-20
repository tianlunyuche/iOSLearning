//
//  UITableView+RWConfig.m
//  SupplyChain
//
//  Created by 刘瑾 on 2016/6/21.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import "UITableView+RWConfig.h"
#import <objc/runtime.h>



@implementation UITableView (RWConfig)

-(void)addMJRefreshHeader:(NSObject *)tagger withSelector:(SEL)selector{
    
    MJRefreshNormalHeader *_mjHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:tagger refreshingAction:selector];
    _mjHeader.lastUpdatedTimeLabel.hidden = YES;
    _mjHeader.stateLabel.textColor = [UIColor colorWithHex:@"9acc35"];
    [_mjHeader setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [_mjHeader setTitle:@"放开刷新" forState:MJRefreshStatePulling];
    [_mjHeader setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    _mjHeader.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _mjHeader.stateLabel.font = [UIFont systemFontOfSize:F_PX_TO_PT(28)];
    self.mj_header = _mjHeader;
    
}

-(void)addMJRefreshFooter:(NSObject *)tagger withSelector:(SEL)selector{
    MJRefreshAutoNormalFooter *_mjFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:tagger refreshingAction:selector];
    [_mjFooter setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [_mjFooter setTitle:@"正在加载中..." forState:MJRefreshStateRefreshing];
    [_mjFooter setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
    _mjFooter.stateLabel.font = [UIFont systemFontOfSize:F_PX_TO_PT(28)];
    _mjFooter.stateLabel.textColor = [UIColor colorWithHex:@"9acc35"];
    _mjFooter.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.mj_footer = _mjFooter;
}

-(void)addDefaultPage:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top{
    [self layoutIfNeeded];
    
    RWWaringTip002 *waringTip = [RWWaringTip002 getInstance];
    waringTip.tag = 1778;
    
    if ([self viewWithTag:1778]) {
        waringTip = (RWWaringTip002 *)[self viewWithTag:1778];
        if (title.length != 0) waringTip.title.text = title;
        if (icon) waringTip.icon.image = icon;
        return;
    }
    if (title.length != 0) waringTip.title.text = title;
    if (icon) waringTip.icon.image = icon;
    [self addSubview:waringTip];
    
    waringTip.frame = CGRectMake(0, top, self.width, self.height - top);
    [waringTip updateConstraints];
}

-(void)addDefaultPage:(NSString *)title andIcon:(UIImage *)icon{
    [self layoutIfNeeded];

    RWWaringTip002 *waringTip = [RWWaringTip002 getInstance];
    waringTip.tag = 1778;
    
    if ([self viewWithTag:1778]) {
        waringTip = (RWWaringTip002 *)[self viewWithTag:1778];
        if (title.length != 0) waringTip.title.text = title;
        if (icon) waringTip.icon.image = icon;
        return;
    }
    if (title.length != 0) waringTip.title.text = title;
    if (icon) waringTip.icon.image = icon;
    [self addSubview:waringTip];

    waringTip.frame = CGRectMake(0, 0, self.width, self.height);
    [waringTip updateConstraints];
}

//-(void)addDefaultPag:(NSString *)title andIcon:(UIImage *)icon{
//    [self layoutIfNeeded];
//    
//    RWWaringTip002 *waringTip = [RWWaringTip002 getInstance];
//    waringTip.tag = 1779;
//    
//    if ([self viewWithTag:1779]) {
//        waringTip = (RWWaringTip002 *)[self viewWithTag:1779];
//        if (title.length != 0) waringTip.title.text = title;
//        if (icon) waringTip.icon.image = icon;
//        return;
//    }
//    if (title.length != 0) waringTip.title.text = title;
//    if (icon) waringTip.icon.image = icon;
//    [self addSubview:waringTip];
//    
//    waringTip.frame = CGRectMake(0, 0, self.width, self.height);
//    [waringTip updateConstraints];
//}

-(void)removeDefaultView{
    
    UIView *temp = [self viewWithTag:1778];
    
    if (temp) {
        [UIView animateWithDuration:.2 animations:^{
            temp.alpha = 0;
        } completion:^(BOOL finished) {
            [[self viewWithTag:1778] removeFromSuperview];
        }];
    }

}

-(void)saleReloadCell:(NSIndexPath *)indexPath{
    [CATransaction begin];
    [self beginUpdates];
    [self reloadRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationAutomatic];
    [self endUpdates];
    [CATransaction commit];
}

@end
