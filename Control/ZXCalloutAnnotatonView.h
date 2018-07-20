//
//  ZXCalloutAnnotatonView.h
//  Control
//
//  Created by xinying on 2016/4/2.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ZXAnnotation.h"

@interface ZXCalloutAnnotatonView : MKAnnotationView

@property (nonatomic ,strong)ZXAnnotation *annotate;

#pragma mark 从缓存取出标注视图
+(instancetype)calloutViewWithMapView:(MKMapView *)mapView;

@end
