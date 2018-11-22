//
//  ZXAVPlayerVC.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXAVPlayerVC.h"
#import <AVFoundation/AVFoundation.h>
#import "MediaPlayer/MediaPlayer.h"
#import "ZXaudioVC.h"

@interface ZXAVPlayerVC ()<MPMediaPickerControllerDelegate,AVAudioRecorderDelegate,AVAudioPlayerDelegate>
{
    
    //音频播放器对象
    AVAudioPlayer* _player;
    UIProgressView* _musicProgress;
}

//音频播放器
@property(nonatomic,retain)AVAudioPlayer* avPlay;
@property(nonatomic,strong)UIButton* btnPlay;
@property(nonatomic,strong)UIButton* btnPause;
@property(nonatomic,strong)UIButton* btnStop;
@property(nonatomic,strong)UISlider* volumeSlider;

//音乐播放进度条视图
@property(nonatomic,strong)UIProgressView* musicProgress;
//定时器对象
@property(nonatomic,strong)NSTimer* protimer;

@property(nonatomic,strong)NSTimer* timer;

@property(nonatomic,strong)UIButton *btn;

@property(nonatomic,strong)UIImageView *lineImg;

@end

@implementation ZXAVPlayerVC

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [_timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatAVPlayer];
    [self playAV];

    // 画虚线
    // 创建一个imageView 高度是你想要的虚线的高度 一般设为2
    _lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 2)];
    // 调用方法 返回的iamge就是虚线
//    _lineImg.image = [self drawLineByImageView:_lineImg];
    [ZXAVPlayerVC drawDashLine:_lineImg lineLength:5 lineSpacing:5 lineColor:[UIColor redColor]];
    // 添加到控制器的view上
    [self.view addSubview:_lineImg];

}

// 返回虚线image的方法
- (UIImage *)drawLineByImageView:(UIImageView *)imageView{
    UIGraphicsBeginImageContext(imageView.frame.size); //开始画线 划线的frame
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    //设置线条终点形状
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    // 5是每个虚线的长度 1是高度
    float lengths[] = {5,1};
    CGContextRef line = UIGraphicsGetCurrentContext();
    // 设置颜色
    CGContextSetStrokeColorWithColor(line, [UIColor colorWithWhite:0.408 alpha:1.000].CGColor);
//    CGContextSetLineDash(line, 0, lengths, 2); //画虚线
    CGContextMoveToPoint(line, 0.0, 2.0); //开始画线
    CGContextAddLineToPoint(line, kScreenWidth - 10, 2.0);
    
    CGContextStrokePath(line);
    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}

// 画虚线
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds =lineView.bounds;
    shapeLayer.position =CGPointMake(CGRectGetWidth(lineView.frame) /2, CGRectGetHeight(lineView.frame));
    shapeLayer.fillColor =[UIColor clearColor].CGColor;
    
    //  设置虚线颜色为blackColor
    shapeLayer.strokeColor =lineColor.CGColor;
    //  设置虚线宽度
    shapeLayer.lineWidth =CGRectGetHeight(lineView.frame);
    shapeLayer.lineJoin =kCALineJoinRound;
    //  设置线宽，线间距
    shapeLayer.lineDashPattern =[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength] ,[NSNumber numberWithInt:lineSpacing] ,nil];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    shapeLayer.path =path;
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

#pragma mark - 播放音乐 和进度条
//创建一个音频控制器
- (void)creatAVPlayer{
    
    //设置后台仍运行
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    //获取本地资源mp3文件的方法。，文件名 和扩展名
    NSString* str =[[NSBundle mainBundle] pathForResource:@"常颖杰-Jason - 南山南（粤语版）" ofType:@"mp3"];
    //将字符串转化成 url
    NSURL* urlMusic =[NSURL fileURLWithPath:str];
    //创建音频播放器对象
    _player =[[AVAudioPlayer alloc] initWithContentsOfURL:urlMusic error:nil];
    //
    [_player prepareToPlay];
    //循环播放的次数 ，-1 无限循环
    _player.numberOfLoops =-1;
    //设置音量大小
    _player.volume =0.5;
    
    _player.delegate =self;
}

//按钮
- (void)playAV{
    //播放 按钮
    _btnPlay =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnPlay.frame =CGRectMake(100, 100, 100, 40);
    [_btnPlay setTitle:@"播放" forState:UIControlStateNormal];
    [_btnPlay addTarget:self action:@selector(pressPlay) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPlay];
    //暂停 按钮
    _btnPause =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnPause.frame =CGRectMake(100, 160, 100, 40);
    [_btnPause setTitle:@"暂停" forState:UIControlStateNormal];
    [_btnPause addTarget:self action:@selector(pressPause) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPause];
    //停止 按钮
    _btnStop =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnStop.frame =CGRectMake(100, 220, 100, 40);
    [_btnStop setTitle:@"停止" forState:UIControlStateNormal];
    [_btnStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnStop];
    //进度条  ,initWithProgressViewStyle:UIProgressViewStyleBar]
    _musicProgress =[[UIProgressView alloc] init];
    _musicProgress.frame =CGRectMake(10, 300, 300, 20);
    _musicProgress.progress =0;
    
    UILabel *labl=[[UILabel alloc] initWithFrame:CGRectMake(10, 318, 100, 40)];
    labl.text =@"调节音量：";
    [self.view addSubview:labl];
    //滑动块 设置声音大小
    _volumeSlider =[[UISlider alloc] initWithFrame:CGRectMake(10, 360, 300, 40)];
    _volumeSlider.maximumValue =100;
    _volumeSlider.minimumValue =0;
    //
    [_volumeSlider addTarget:self action:@selector(volumChange:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_musicProgress];
    [self.view addSubview:_volumeSlider];
    
    [self addAudio];
}

- (UIButton *)btn{
    
    if (!_btn) {
        //控制我们的录音功能
        self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame =CGRectMake(0, 0, 60, 30);
        [self.btn setTitle:@"录音 " forState:UIControlStateNormal];
        [self.btn setBackgroundColor:[UIColor cyanColor]];
        //按钮被按下
        [self.btn addTarget:self action:@selector(btnDown) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)addAudio{
    
    UIBarButtonItem *btnItem =[[UIBarButtonItem alloc] initWithCustomView:self.btn];
    self.navigationItem.rightBarButtonItem =btnItem;
}

- (void)btnDown{
    [self.navigationController pushViewController:[[ZXaudioVC alloc] init] animated:YES];
}

- (void)pressPlay{
    NSLog(@"播放音乐");
    [_player play];
    //
    _protimer =[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateT) userInfo:nil repeats:YES];
}

- (void)pressPause{
    NSLog(@"暂停");
    [_player pause];
}

- (void)pressStop{
    NSLog(@"停止播放");
    [_player stop];
    //当前播放事件清零
    _player.currentTime =0;
}

- (void)volumChange:(UISlider *)slider{
    NSLog(@"%f",slider.value );
    //    _musicProgress.progress = slider.value /100;
    //
    _player.volume =slider.value /100;
}

- (void)updateT{
    
    _musicProgress.progress = _player.currentTime / _player.duration ;
}

//当播放完成时调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    //停止定时器
    [_timer invalidate];
}

- (void)dealloc{
    //停止定时器
    [_timer invalidate];
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
