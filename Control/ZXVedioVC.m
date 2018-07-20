//
//  ZXVedioVC.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXVedioVC.h"
#import <AVFoundation/AVFoundation.h>
#import "MediaPlayer/MediaPlayer.h"

@interface ZXVedioVC ()<MPMediaPickerControllerDelegate>

@property(nonatomic,strong)MPMoviePlayerController* playController;
@property (nonatomic, strong) MPMusicPlayerController *musicPlayer;

@end

@implementation ZXVedioVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatMusic];
    [self creatVieo];
}

#pragma mark - 音频播放器
- (void)creatMusic{
    ZXLog(@"音频播放");
    MPMusicPlayerController *MusicVC =[[MPMusicPlayerController alloc] init];
}

#pragma mark - 视频播放器
- (void)creatVieo{
    
    //创建一个字符串，保存视频的网络地址
    NSString* strURl =@"http://xinhabavtest.oss-cn-qingdao.aliyuncs.com/VID_20160328_192544.mp4";
//    NSString* strURl =@"http://dat.paohon.com/1507737803567-1843010000.mp4?e\u003d1507824876\u0026token\u003dOkD_9hytMTFUyioNq6RET1VDNQcN9tY1_2FUg561:gMpYdOk7gec2D55DhCtG2jH-dww\u003d";
    NSURL* url =[NSURL URLWithString:strURl];
    
    //创建一个视图播放器对象
    _playController =[[MPMoviePlayerController alloc] initWithContentURL:url];
    //视图大小赋值
    _playController.view.frame =CGRectMake(0, 50, 400, 300);
    //视频下载后 的处理编解码的过程
    [_playController prepareToPlay];
    //将播放器添加到 当前视图上
    [self.view addSubview:_playController.view];

    //创建另一个视图播放控制器 ，这一个可以横屏 和竖屏 切换
    //    _playerView =[[MPMoviePlayerViewController alloc] initWithContentURL:url];
    //    _playerView.view.frame =self.view.bounds;
    //    [self.view addSubview:_playerView.view];
    
    UIButton* btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.tintColor =[UIColor whiteColor];
    btn.backgroundColor =[UIColor blueColor];
    [btn setTitle:@"选择播放资源" forState:UIControlStateNormal];
    btn.frame =CGRectMake(120, 400, 120, 40);
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //    mediaPicker.view.frame =CGRectMake(0, 400, kscreen.width, 200);
    //    [self.view addSubview:mediaPicker.view];
}


- (void)pressBtn{
    //选择界面
    MPMediaPickerController *mediaPicker =[[MPMediaPickerController alloc] init];
    mediaPicker.delegate =self;
    [self presentViewController:mediaPicker animated:YES completion:^{
        ZXLog(@"成功弹出");
    }];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    
    [self.musicPlayer setQueueWithItemCollection:mediaItemCollection];
    ZXLog(@"didPickMediaItems");
    //列出选择歌曲清单
    NSMutableString *strTitle =[[NSMutableString alloc] initWithString:@""];
    for (MPMediaItem *item in [mediaItemCollection items]) {
        
        [strTitle appendString:[item valueForProperty:MPMediaItemPropertyTitle]];
        [strTitle appendString:@"\n"];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        ZXLog(@"选中");
    }];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    
    ZXLog(@"cancel");
    [self dismissViewControllerAnimated:YES completion:^{
        ZXLog(@"返回主页面");
    }];
}

- (void)dealloc{
    _playController=nil;
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
