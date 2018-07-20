//
//  ZXCreatMyMapVC.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXCreatMyMapVC.h"
//定位服务 ,地图
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
//大头针
#import "ZXAnnotation.h"
#import "ZXCalloutAnnotatonView.h"
#import "ZXAlert.h"

@interface ZXCreatMyMapVC ()

@property (strong, nonatomic)CLGeocoder *geocoder;

@end

@implementation ZXCreatMyMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CreatMyMap];
    [self Creatgeocoder];
}

#pragma mark - 定位服务 ,获取地名
- (void)Creatgeocoder{
    
    _geocoder =[[CLGeocoder alloc] init];
    [self getCoordinateByAddress:@"广州"];
    [self getAddressByLatitude:11.3 longitude:12];
}

//根据地名 获取地址
- (void)getCoordinateByAddress:(NSString *)address{
    
    //地理编码
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //取得第一个地标，
        CLPlacemark *placemark =[placemarks firstObject];
        CLLocation *location =placemark.location;           //位置
        CLRegion *region =placemark.region;                 //区域
        NSDictionary *addressDic =placemark.addressDictionary;  //详细地址信息字典
        NSLog(@"位置:%@,区域:%@,详细信息:%@",location,region,addressDic);
    }];
}

//根据地标 取得 地名
-(void)getAddressByLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude{
    
    //反地理编码
    CLLocation *location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark=[placemarks firstObject];
        NSLog(@"详细信息:%@",placemark.addressDictionary);
    }];
}



#pragma mark - 使用手机自带的地图
- (void)CreatMyMap{
    
    _geocoder=[[CLGeocoder alloc]init];
    [_geocoder geocodeAddressString:@"广州市番禺区" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //获取第一个地标
        CLPlacemark *clPlacemark =[placemarks firstObject];
        NSLog(@"%@",placemarks);
        //定位地标 转换成 地图地标
        MKPlacemark *mkplacemark1 =[[MKPlacemark alloc] initWithPlacemark:clPlacemark];
        
        //注意地理编码一次只能定位到一个位置，不能同时定位，所在放到第一个位置定位完成回调函数中再次定位
        [_geocoder geocodeAddressString:@"广州市天河区" completionHandler:^(NSArray *placemarks, NSError *error) {
            
            CLPlacemark *clPlacemark2=[placemarks firstObject];//获取第一个地标
            MKPlacemark *mkPlacemark2=[[MKPlacemark alloc]initWithPlacemark:clPlacemark2];
            
            NSDictionary *options=@{MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard)};
            //            MKMapItem *mapItem0=[MKMapItem mapItemForCurrentLocation];//当前位置
            MKMapItem *mapItem1=[[MKMapItem alloc]initWithPlacemark:mkplacemark1];
            MKMapItem *mapItem2=[[MKMapItem alloc]initWithPlacemark:mkPlacemark2];
            //            [MKMapItem openMapsWithItems:@[mapItem1,mapItem2] launchOptions:options];
            [mapItem1 openInMapsWithLaunchOptions:options];
            [mapItem2 openInMapsWithLaunchOptions:options];
        }];
        
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
