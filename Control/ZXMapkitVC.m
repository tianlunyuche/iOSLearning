//
//  ZXMapkitVC.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXMapkitVC.h"
//定位服务 ,地图
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
//大头针
#import "ZXAnnotation.h"
#import "ZXCalloutAnnotatonView.h"
#import "ZXAlert.h"

@interface ZXMapkitVC ()<MKMapViewDelegate>

@property(strong,nonatomic) MKMapView *mapView;

@end

@implementation ZXMapkitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self CreatMap];
}

#pragma mark - Mapkit 地图 和大头针
- (void)CreatMap{
    
    _mapView =[[MKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_mapView];
    //设置代理
    _mapView.delegate =self;
    //请求定位服务
    CLLocationManager *locationMgr=[[CLLocationManager alloc] init];
    if(![CLLocationManager locationServicesEnabled]||
       [CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse){
        [locationMgr requestWhenInUseAuthorization];
    }
    
    //用户位置追踪
    _mapView.userTrackingMode =MKUserTrackingModeFollow;
    
    _mapView.mapType =MKMapTypeStandard;
    //添加 大头针
    //    [_mapView addAnnotation:self.annotation];
    //添加 自定义大头针
    [_mapView addAnnotation:self.myannotation];
    [_mapView addAnnotation:self.myannotation2];
}

- (ZXAnnotation *)myannotation{
    
    ZXAnnotation *annotation =[[ZXAnnotation alloc] init];
    annotation.title =@"xin";
    annotation.subtitle =@"The more effort ,the more lucky";
    annotation.coordinate =CLLocationCoordinate2DMake(23.11, 113.27);
    annotation.image =[UIImage imageNamed:@"tag_selected"];
    annotation.icon=[UIImage imageNamed:@"alert_big_icon"];
    annotation.detail=@"幸运儿";
    annotation.rate=[UIImage imageNamed:@"ssdk_oks_classic_qq"];
    
    return annotation;
}
- (ZXAnnotation *)myannotation2{
    
    ZXAnnotation *annotation =[[ZXAnnotation alloc] init];
    annotation.title =@"handsome";
    annotation.subtitle =@" more lucky";
    annotation.coordinate =CLLocationCoordinate2DMake(25.11, 115.27);
    annotation.image =[UIImage imageNamed:@"date_select_p"];
    annotation.icon=[UIImage imageNamed:@"rll_progress"];
    annotation.detail=@"这里";
    annotation.rate=[UIImage imageNamed:@"ssdk_oks_classic_qzone"];
    
    return annotation;
}

- (ZXAnnotation *)annotation{
    
    ZXAnnotation *annotation =[[ZXAnnotation alloc] init];
    annotation.title =@"❤️";
    annotation.subtitle =@"The more effort ,the more lucky";
    annotation.coordinate =CLLocationCoordinate2DMake(23.11, 113.27);
    annotation.image =[UIImage imageNamed:@"tag_selected"];
    return annotation;
}

//地图代理方法
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[ZXAnnotation class]]) {
        //        static NSString *key =@"annotationkey";
        //        MKAnnotationView *annotationView =[mapView dequeueReusableAnnotationViewWithIdentifier:key];
        //
        //        //如果缓存池不存在则 新建
        //        if (!annotationView) {
        //            annotationView =[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:key];
        //            annotationView.canShowCallout =true;  //允许交互点击
        //            annotationView.calloutOffset =CGPointMake(0, 1);    //定义详情视图偏移量
        //            annotationView.leftCalloutAccessoryView=kImgV(@"alert");//定义详情左侧视图
        //        }
        //
        //        //修改大头针视图
        //        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        //        annotationView.annotation=annotation;
        //        annotationView.image=((ZXAnnotation *)annotation).image;//设置大头针视图的图片
        //
        //--------------------------自定义后添加的
        ZXCalloutAnnotatonView *calloutView=[ZXCalloutAnnotatonView calloutViewWithMapView:mapView];
        calloutView.annotation=annotation;
        return calloutView;
    }
    else{
        return nil;
    }
}


#pragma mark 选中大头针时触发
//点击一般的大头针KCAnnotation时添加一个大头针作为所点大头针的弹出详情视图
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    ZXAnnotation *annotation=view.annotation;
    if ([view.annotation isKindOfClass:[ZXAnnotation class]]) {
        //点击一个大头针时移除其他弹出详情视图
        //        [self removeCustomAnnotation];
        //添加详情大头针，渲染此大头针视图时将此模型对象赋值给自定义大头针视图完成自动布局
        ZXAnnotation *annotation1=[[ZXAnnotation alloc]init];
        annotation1.icon=annotation.icon;
        annotation1.detail=annotation.detail;
        annotation1.rate=annotation.rate;
        annotation1.coordinate=view.annotation.coordinate;
        [mapView addAnnotation:annotation1];
    }
}

#pragma mark 取消选中时触发
//-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
//    [self removeCustomAnnotation];
//}

#pragma mark 移除所用自定义大头针
-(void)removeCustomAnnotation{
    [_mapView.annotations enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[ZXAnnotation class]]) {
            [_mapView removeAnnotation:obj];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
