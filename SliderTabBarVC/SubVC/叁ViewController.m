//
//  叁ViewController.m
//  CCSildeTabBarController
//
//  Created by wsk on 16/8/22.
//  Copyright © 2016年 cyd. All rights reserved.
//

#import "叁ViewController.h"

@interface 叁ViewController ()

@end

@implementation 叁ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 150, 300, 100)];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
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
