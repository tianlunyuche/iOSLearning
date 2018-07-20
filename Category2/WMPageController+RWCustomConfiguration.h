//
//  WMPageController+RWCustomConfiguration.h
//  SupplyChain
//
//  Created by 刘瑾 on 2016/12/30.
//  Copyright © 2016年 libin. All rights reserved.
//

#import "WMPageController.h"

@interface WMPageController (RWCustomConfiguration)

-(void )setupRWConfigurationInLoadView;
-(void )setupRWConfigurationInViewDidLoad;
-(void )setupRWConfigurationInViewWillAppear;

-(void)showSeparatorLine;
-(void)hiddenSeparatorLine;

@end
