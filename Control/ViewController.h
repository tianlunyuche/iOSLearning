//
//  ViewController.h
//  Control
//
//  Created by xinying on 2016/1/14.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXMacro.h"

#import <AVFoundation/AVFoundation.h>
#import "MediaPlayer/MediaPlayer.h"

#import "AFNetworking.h"
//#import "UIImageView+WebCache.h"
#import "BookModel.h"
//主要用于在线流媒体的播放
#import <AudioToolbox/AudioToolbox.h>
//提供音频和回放的底层API ，负责管理音频硬件
//#import <AVFoundation/AVFoundation.h>

//--------通讯录
#import <AddressBook/AddressBook.h>
#import "AddressBookUI/AddressBookUI.h"


#import <AVFoundation/AVFoundation.h>
#import "MediaPlayer/MediaPlayer.h"
//主要用于在线流媒体的播放
#import <AudioToolbox/AudioToolbox.h>
//提供音频和回放的底层API ，负责管理音频硬件
//#import <AVFoundation/AVFoundation.h>
#import "AFNetworking.h"
//#import "UIImageView+WebCache.h"
#import "BookModel.h"


@interface ViewController : UIViewController
{
    
    //定义视图对象
    UIImageView* _imageView;
    
    UISwitch* _mySwitch;
    
    UITextField* _textField;
    
    UIAlertView* _alerView;
    
    UIActivityIndicatorView* _activityIndicatorView;
    
    UIStepper* _stepper;
    
    UISegmentedControl* _segControl;
    //一般用于下载或视频播放的进度
    UIProgressView* _progressView;
    //一般用于调整音乐的音量
    UISlider* _slider;
    
    NSTimer* _timer;
    //定义线程对象
    NSThread* _thread1;
    NSThread* _thread2;
    
    //定义一个计数器，integer
    NSInteger _counter;
    
    //线程锁对象
    NSLock* _lock;
    
    //图像
    UIImageView* _imgv;
    
    //定义一个任务队列对象
    NSOperationQueue* _queue;
    
    //播放按钮
    UIButton* _btnPlay;
    //暂停
    UIButton* _btnPause;
    //停止
    UIButton* _btnStop;
    //音乐播放进度条视图
    UIProgressView* _musicProgress;
    //声音大小调整滑动条
    UISlider* _volumeSlider;
    //静音开关
    UISwitch* _vomumOn;
    //音频播放器对象
    AVAudioPlayer* _player;
    //定时器对象
    NSTimer* _protimer;
    
    //定义一个播放器对象
    MPMoviePlayerController* _playController;
    MPMoviePlayerViewController* _playerView;
    
    //
    UITableView* _tableView;
    NSMutableArray* _arrayData;
    UIBarButtonItem* _btnLoadData;
    UIBarButtonItem* _btnEdit;
  

    //设置定时检测，用来监听当前音量大小，控制话筒图片
    NSTimer* timer;
    

    
}

@property(retain,nonatomic)UISwitch* mySwitch;

@property(retain,nonatomic) UITextField* textField;

@property(retain,nonatomic)UIAlertView* alerView;

@property(retain,nonatomic)UIActivityIndicatorView* activityIndicatorView;

@property(retain,nonatomic)UIStepper* stepper;

@property(retain,nonatomic)UISegmentedControl* segControl;

@property(retain,nonatomic)UIProgressView* progressView;

@property(retain,nonatomic)UISlider* slider;

@property(retain,nonatomic)NSTimer* timer;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (nonatomic, assign) int count;
//控制我们的录音功能
@property(nonatomic,retain)UIButton* btn;
//播放已经录好的音频文件
@property(nonatomic,retain)UIButton* playBtn;
//控制音量的图片
@property(nonatomic,retain)UIImageView* imageView;
//音频播放器
@property(nonatomic,retain)AVAudioPlayer* avPlay;

@property(nonatomic,retain)UISearchBar * searchBar;
@property(nonatomic,retain)UISearchDisplayController *searchDisplayController;

@property(nonatomic,strong)UITextView *textview;


@end

