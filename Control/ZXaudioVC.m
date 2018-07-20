//
//  ZXaudioVC.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXaudioVC.h"
#import <AVFoundation/AVFoundation.h>

@interface ZXaudioVC ()

//用于录音
@property(nonatomic,strong)AVAudioRecorder* recorder;

@property(nonatomic,strong)NSTimer* timer;
//控制音量的图片
@property(nonatomic,retain)UIImageView* imageView;

@property(nonatomic,strong)UIButton *btn;

@property(nonatomic,strong)NSURL* urlPlay;

@end

@implementation ZXaudioVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self audio];
}

#pragma mark - 录音
//录音设置
- (void)audio{
    //先配置 Recorder
    NSMutableDictionary* recordSetting =[NSMutableDictionary dictionary];
    //设置录音格式
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    //设置录音采样率
    [recordSetting setValue:[NSNumber numberWithFloat:44100] forKey:AVSampleRateKey];
    //录音的通道数
    [recordSetting setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
    //采样位数8 ，16 ，24 ，32
    [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //录音质量
    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
    //
    NSString* strUrl =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    _urlPlay =[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/record.aac",strUrl]];
    NSError* error;
    //创建一个带有保存录音路径的 录音器
    _recorder =[[AVAudioRecorder alloc] initWithURL:_urlPlay settings:recordSetting error:&error];
    
    //开启音量检测
    _recorder.meteringEnabled =YES;
    _recorder.delegate =self;
    
    //一，进行录音设置
    self.imageView =[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width -100) /2, 100, 100, 100)];
    
    [self.view addSubview:self.imageView];
    
    //控制我们的录音功能
    self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame =CGRectMake(self.imageView.frame.origin.x, 250, 50, 40);
    [self.btn setTitle:@"start " forState:UIControlStateNormal];
    [self.btn setBackgroundColor:[UIColor blackColor]];
    
    //按钮被按下
    [self.btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchDown];
    //手指抬起时
    [self.btn addTarget:self action:@selector(btnUp:) forControlEvents:UIControlEventTouchUpInside];
    
    //    当触摸拖动离开控制范围时
    [self.btn addTarget:self action:@selector(btnDrapUp:) forControlEvents:UIControlEventTouchDragExit];
    [self.view addSubview:self.btn];
    
}

- (void)btnDown:(UIButton *)sender{
    
    [sender setTitle:@"stop " forState:UIControlStateNormal];
    //创建录音文件，准备录音
    if ([_recorder prepareToRecord]){
        //开始
        [_recorder record];
    }
    //设置定时检测
    _timer =[NSTimer scheduledTimerWithTimeInterval:0 target:self  selector:@selector(detectionVoice) userInfo:nil repeats:YES];
    
}
//检测当前声音
- (void)detectionVoice{
    
    [_recorder updateMeters]; //刷新当前音量数据
    double lowPassResults =pow(10 ,(0.05* [_recorder peakPowerForChannel:0]));
    //取值范围现在是0～1
    if(0 <lowPassResults <=0.06){
        [self.imageView setImage:[UIImage imageNamed:@"1"]];
    }else
        if(0.06 <lowPassResults <=0.13){
            [self.imageView setImage:[UIImage imageNamed:@"2"]];
        }else
            if(0.13 <lowPassResults <=0.20){
                [self.imageView setImage:[UIImage imageNamed:@"3"]];
            }else
                if(0.20 <lowPassResults <=0.27){
                    [self.imageView setImage:[UIImage imageNamed:@"4"]];
                }else
                    if(0.27 <lowPassResults <=0.34){
                        [self.imageView setImage:[UIImage imageNamed:@"5"]];
                    }else
                        if(0.34 <lowPassResults <=0.41){
                            [self.imageView setImage:[UIImage imageNamed:@"6"]];
                        }else
                            if(0.41 <lowPassResults <=0.48){
                                [self.imageView setImage:[UIImage imageNamed:@"7"]];
                            }else
                            {
                                [self.imageView setImage:[UIImage imageNamed:@"9"]];
                            }
    
}

- (void)btnUp:(UIButton *)sender{
    
    [sender setTitle:@"start" forState:UIControlStateNormal];
    double cTime =_recorder.currentTime;
    if (cTime >2){
        ZXLog(@"放出去");
    }else{
        //删除记录文件
        [_recorder deleteRecording];
    }
    [_recorder stop];
    [_timer invalidate];
}


- (void)btnDrapUp:(UIButton *)sender{
    
    [sender setTitle:@"start" forState:UIControlStateNormal];
    //删除录制文件
    [_recorder deleteRecording];
    [_recorder stop];
    [_timer invalidate];
    ZXLog(@"取消发送");
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
