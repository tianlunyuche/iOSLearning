//
//  UITableView+RWConfig.h
//  SupplyChain
//
//  Created by zhaozhuangxin on 2016/6/21.
//  Copyright © 2016年 Runwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (RWConfig)

-(void)addMJRefreshHeader:(NSObject *)tagger withSelector:(SEL)selector;
-(void)addMJRefreshFooter:(NSObject *)tagger withSelector:(SEL)selector;

-(void)addDefaultPage:(NSString *)title andIcon:(UIImage *)icon;
//-(void)addDefaultPag:(NSString *)title andIcon:(UIImage *)icon;
-(void)addDefaultPage:(NSString *)title andIcon:(UIImage *)icon andTop:(CGFloat)top;
-(void)removeDefaultView;
-(void)saleReloadCell:(NSIndexPath *)indexPath;
@end
