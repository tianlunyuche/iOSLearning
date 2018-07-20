//
//  ZXQRcodeVC.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXQRcodeVC.h"
#import "UIImage+ZXQRcode.h"

@interface ZXQRcodeVC ()
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UIButton *getQRBtn;
@property(nonatomic,strong) UIImageView *imgV;
@property(nonatomic,strong) UIImage *image;
@end

@implementation ZXQRcodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.text.text =@"http://www.habav.com/";

    [self.view addSubview:self.imgV];
    self.imgV.image =[self QRcodeCreat];
    
    [self.getQRBtn addTarget:self action:@selector(QRcodeCreat) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 二维码生成
- (UIImage *)QRcodeCreat{
    
    UIImage *img  =[UIImage imageOfQRFromURL:self.text.text codeSize:500 red:130 green:100.0 blue:100.0 insertImage:self.image roundRadius:100.0f];
    self.imgV.image =img;
    return img;
}

-(UIImageView *)imgV{
    if (!_imgV) {
        _imgV =[[UIImageView alloc ] initWithFrame:CGRectMake(10, 250, 300, 300)];
    }
    return _imgV;
}

-(UIImage *)image{
    if (!_image) {
        _image =[UIImage imageNamed:@"tag_selected"];
    }
    return _image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
