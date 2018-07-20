//
//  UIViewController+LJCustomConfiguration.m
//  SupplyChain
//
//  Created by 刘瑾 on 2016/12/6.
//  Copyright © 2016年 libin. All rights reserved.
//

#import "UIViewController+LJCustomConfiguration.h"

@implementation UIViewController (LJCustomConfiguration)

-(void)initSubview{}

-(void)loadDataModel{}

-(void)updataToView{}

-(void)setupBackBarItem{

    UIBarButtonItem *backButonItem = [UIBarButtonItem new];
    backButonItem.title = @"";
    backButonItem.tintColor = [UIColor colorIsFontOfNavigateBar];
    self.navigationItem.backBarButtonItem = backButonItem;
}

-(void)setupNavigationBar{
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor colorIsFontOfNavigateBar];
    NSDictionary <NSString *, id> *dic= [NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorIsFontOfNavigateBar], NSForegroundColorAttributeName, [UIFont systemFontOfSize:17], NSFontAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
}

//显示自定义加载视图
-(void)showRWProgressHUD:(NSString *)tip{
    
    UIView *progressView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:progressView];
    [[UIApplication sharedApplication].keyWindow addSubview:progressView];
    progressView.tag = 14014;
    progressView.backgroundColor = [UIColor colorWithHex:@"000000" alpha:RWBackGroudViewAlpha];
    
    UIView *showProgressView = [UIView new];
    [progressView addSubview:showProgressView];
    [showProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
        make.width.equalTo(120);
        make.height.equalTo(130);
    }];
    showProgressView.backgroundColor = [UIColor whiteColor];
    showProgressView.layer.cornerRadius = 5;
    showProgressView.layer.masksToBounds = YES;
    
    UIImageView *iv = [UIImageView new];
    [showProgressView addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(0).equalTo(-6);
        make.width.height.equalTo(54);
    }];
    iv.image = [UIImage sd_animatedGIFNamed:@"loading"];
    
    [progressView setNeedsLayout];
    
    UILabel *tipLabel = [UILabel new];
    [progressView addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(iv);
        make.top.equalTo(iv.mas_bottom).offset(12);
    }];
    tipLabel.textColor = [UIColor colorWithHex:@"2e2e2e"];
    tipLabel.text = tip ? : @"加载中...";
    tipLabel.font = [UIFont systemFontOfSize:12];
    
}

//隐藏自定义加载视图
-(void)dissmissRWProgressHUD{
    UIView *progressView = [[UIApplication sharedApplication].keyWindow viewWithTag:14014];
    if (progressView) {
        [progressView removeFromSuperview];
    }
    
}

//显示加载视图
-(void)showProgressHUD:(NSString *)tip{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = tip ? tip : @"载入中...";
    hud.bezelView.color = [UIColor colorWithHex:@"000000"];
    hud.bezelView.alpha = 0.7;
    hud.label.textColor = [UIColor whiteColor];
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    hud.userInteractionEnabled = NO;
}

//取消加载视图
-(void)dissmissProgressHUD{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

//
+(UIViewController *)getCurrentVC{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(void)showNoItemInList{
    UIImageView *iv = [self.view viewWithTag:1234];
    if (!iv) {
        iv = [UIImageView new];
        iv.image = [UIImage imageNamed:@"3-noItem"];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:iv];
        iv.tag = 1234;
    }
    [self.view setNeedsLayout];
    float height = self.view.frame.size.height;
    if (height > 1000) {
        height = height / 2;
    }
    
    iv.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
    
}

-(void)dismissNoItemInList{
    UIView *v = [self.view viewWithTag:1234];
    if (v) {
        [v removeFromSuperview];
    }
}
//获取Window当前显示的ViewController
+ (UIViewController*)currentViewController{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    UIViewController* vc = window.rootViewController;
    
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
        
    }
    
    return vc;
}
@end
