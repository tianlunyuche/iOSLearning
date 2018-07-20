//
//  ZXDecorativeVC.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXDecorativeVC.h"
#import "House.h"
#import "TableDecorator.h"
#import "ChairDecorator.h"
#import "CommercialHouse.h"
#import "ContentVIew.h"

@interface ZXDecorativeVC ()

@property(nonatomic,strong)ContentVIew *contentView;

@end

@implementation ZXDecorativeVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatText];
    [self dealData];
}

- (ContentVIew *)contentView{
    
    
    CGRect textViewRect =CGRectInset(self.view.bounds, 10.0, 20.0);
    if (!_contentView) {
        _contentView =[[ContentVIew alloc] initWithFrame:textViewRect];
        ZXLog(@"fdwwe");
    }
    return _contentView;
}

- (void)creatText{
    
    [self.view addSubview:self.contentView];
    [self.contentView concreteContentwithFileName:@"decoratorMode" ofType:@"txt"];
}

- (void)dealData{
    
    House  *house=[[CommercialHouse alloc]init];
    
    house=[[TableDecorator alloc]initWithHouse:house].house;
    house=[[ChairDecorator alloc]initWithHouse:house].house;
    ZXLog(@"房子价格:%f", [house totalMoney]);
    ZXLog(@"房子详情:%@",[house detialInfo]);
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
