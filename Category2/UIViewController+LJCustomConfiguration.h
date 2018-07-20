//
//  UIViewController+LJCustomConfiguration.h
//  SupplyChain
//
//  Created by 刘瑾 on 2016/12/6.
//  Copyright © 2016年 libin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LJCustomConfiguration)

+(UIViewController *)getCurrentVC;

+ (UIViewController*)currentViewController;

-(void )initSubview;

-(void )loadDataModel;

-(void )updataToView;

-(void )setupBackBarItem;

-(void )setupNavigationBar;

-(void)showProgressHUD:(NSString *)tip;
-(void)dissmissProgressHUD;

-(void )showRWProgressHUD:(NSString *)tip;
-(void)dissmissRWProgressHUD;

-(void )showNoItemInList;
-(void )dismissNoItemInList;

@end
