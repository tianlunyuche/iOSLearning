//
//  ZXFlyWeightVC.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXFlyWeightVC.h"
#import "WebSiteProtocol.h"
#import "WebSiteFactory.h"
#import "ConcreteWebSite.h"
#import "User.h"
#import "ContentVIew.h"

typedef id<WebSiteProtocol> WebsiteType;

@interface ZXFlyWeightVC ()

@property(nonatomic,strong)ContentVIew *contentView;

@end

@implementation ZXFlyWeightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"享元模式";
    
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
    [self.contentView concreteContentwithFileName:@"flyweights" ofType:@"txt"];
}

- (void)dealData{

    //工厂方法返回 各种具体享元对象，维护池中的享元对象
    WebSiteFactory *factory =[[WebSiteFactory alloc] init];
    
    //返回具体享元对象
    WebsiteType type1 =[factory getWebSiteCategory:@"首页"];
    User *user1 =[[User alloc] init];
    user1.userName =@"庄子";
    //享元对象都具有use方法
    [type1 user:user1];
    
    WebsiteType type2 =[factory getWebSiteCategory:@"商店"];
    User *user2 =[[User alloc] init];
    user2.userName =@"老子";
    //享元对象都具有use方法
    [type2 user:user2];
    
    NSInteger count =[factory getWebSiteCount];
    ZXLog(@"个数：%ld",(long)count);
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
