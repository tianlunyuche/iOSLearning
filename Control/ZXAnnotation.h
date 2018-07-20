//
//  ZXAnnotation.h
//  Control
//
//  Created by xinying on 2016/4/2.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ZXAnnotation : NSObject <MKAnnotation>


@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

//自定义一个图片属性在创建大头针视图时使用
@property (nonatomic,strong) UIImage *image;

//大头针详情左侧图标
@property (nonatomic,strong) UIImage *icon;
//大头针详情描述
@property (nonatomic,copy) NSString *detail;
//大头针右下方
@property (nonatomic,strong) UIImage *rate;

@end
