//
//  MBProgressHUD+CH.h
//  SupplyChain
//
//  Created by YI on 2016/12/20.
//  Copyright © 2016年 libin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface MBProgressHUD (CH)

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view time:(NSInteger)time;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view time:(NSInteger)time;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end
