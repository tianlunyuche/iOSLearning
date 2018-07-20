//
//  ZXThreadVC.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXThreadVC.h"

@interface ZXThreadVC ()
//控制音量的图片
@property(nonatomic,retain)UIImageView* imageView;
//通知 观察者
@property (nonatomic, weak) id observe;

//定义线程对象
@property(nonatomic,strong)NSThread* thread1;
@property(nonatomic,strong)NSThread* thread2;

//定义一个计数器，integer
@property(nonatomic,assign)NSInteger counter;

//线程锁对象
@property(nonatomic,strong)NSLock* lock;

@end

@implementation ZXThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"后台下载网络图片，主线程加载图片";
    
    [self threadCommunication];
    [self NSNotificationCenterCreat];
    [self NSThreadCreat];
}

#pragma mark - 线程间通信
- (void)threadCommunication{
    
    _imageView =[[UIImageView alloc] initWithFrame:CGRectMake(100, 350, 200, 200)];
    [self.view addSubview:_imageView];
    _imageView.backgroundColor =[UIColor grayColor];
    _imageView.userInteractionEnabled =YES;
    UITapGestureRecognizer *singletap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendNotificate)];
    [_imageView addGestureRecognizer:singletap];
    
    [self performSelectorInBackground:@selector(downloadPic) withObject:nil];
    ZXLog(@"current thread = %@",[NSThread currentThread]);
}

- (void)downloadPic{
    
    //将图片转成二进制数据，比较耗时操作
    NSData *data =[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://onm2lgj62.bkt.clouddn.com/2.jpg"]];
    //
    UIImage *img =[UIImage imageWithData:data];
    
    //回到主线程设置图片
    [self performSelectorOnMainThread:@selector(senderImage:) withObject:img waitUntilDone:NO];
    
    ZXLog(@"current thread2 = %@",[NSThread currentThread]);
}

-(void)senderImage:(UIImage *)image
{
    _imageView.image = image;
    ZXLog(@"current thread3 = %@",[NSThread currentThread]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 通知中心
- (void)NSNotificationCenterCreat{
    
//    UIButton *send =[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    send.backgroundColor=[UIColor redColor];
//    send.frame=CGRectMake(50, 50, 60, 40);
//    [send addTarget:self action:@selector(sendNotificate) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:send];
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNotification) name:@"tongzhi" object:nil];
    //第二种方法
    //Name: 通知的名称
    //object:谁发出的通知
    //queue: 队列,决定 block 在哪个线程中执行, nil  在发布通知的线程中执行
    //usingBlock: 只要监听到通知,就会执行这个 block
    //这个通知返回一个 id 这个通知同样需要移除
    _observe = [[NSNotificationCenter defaultCenter] addObserverForName:@"tongzhi" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        ZXLog(@"收到了通知%@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            [[ZXtoast shareInstance] tipview:@"收到了通知" currentview:self.view];
        });

    }];
}

- (void)sendNotificate{
    
    //发送一个通知
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"tongzhi" object:nil];
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"tongzhi" object:nil userInfo:nil];
    //发送通知 ,异步发送通知, 主线程监听通知
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        ZXLog(@"sendNotificate =%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"tongzhi" object:nil];
    });
}

- (void)addNotification{
    ZXLog(@"addNotification =%@",[NSThread currentThread]);
    ZXLog(@"当调用了发送通知方法后，会执行当前方法");
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - NSThread 线程 ，NSLock 线程锁 确保了加法操作的安全性
- (void)NSThreadCreat{
    //当按钮 较多时，可以用 tag 来分别标识 ，不同按钮可以 触发不同的 事件
    for (int i =0;i<4 ;i++){
        UIButton* btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame =CGRectMake(100, 100+50*i, 120, 40);
        
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag =101 +i;
        if (i ==0){
            [btn setTitle:@"启动线程1" forState:UIControlStateNormal];
        }
        else if (i ==1){
            [btn setTitle:@"启动线程2" forState:UIControlStateNormal];
        }
        else if (i ==2){
            [btn setTitle:@"启动线程3" forState:UIControlStateNormal];
        }
        else if (i ==3){
            [btn setTitle:@"停止所有线程" forState:UIControlStateNormal];
        }
        [self.view addSubview:btn];
    }
}

- (void)pressBtn:(UIButton *)btn{
    
    NSThread* newT ,*newT3;
    if (btn.tag ==101){
        ZXLog(@"按钮1 按下了");
        
        //创建线程 对象
        newT =[[NSThread alloc] initWithTarget:self selector:@selector(actNew:) object:nil];
        //开启运行线程
        [newT start];
    }
    else if(btn.tag ==102){
        ZXLog(@"按钮2 按下了");
        //创建并且启动线程
        [NSThread detachNewThreadSelector:@selector(actT:) toTarget:self withObject:nil];
    }
    else if(btn.tag ==103){
        ZXLog(@"按钮3 按下了");
        
        //创建线程 对象
        newT3 =[[NSThread alloc] initWithTarget:self selector:@selector(actT3:) object:nil];
        //开启运行线程
        [newT3 start];
    }
    else if(btn.tag ==104){
        [newT cancel];
        [newT3 cancel];
    }

    _lock =[[NSLock alloc] init];
}

- (void)actT3:(NSThread *) thread{
    int i = 0;
    while (true) {
        i++;
        if (i >10000) {
            break ;
        }
        //线程锁 确保了加法操作的安全性
        [_lock lock];
        _counter++;
        [_lock unlock];
        NSLog(@"c3 =%ld" ,_counter);
    }
    NSLog(@"c3 final = %ld",_counter);
}



- (void)actT:(NSThread *) thread{
    int i = 0;
    while (true) {
        i++;
        if (i >10000) {
            break ;
        }
        _counter++;
        NSLog(@"c2 =%ld" ,_counter);
        
        if ([[NSThread currentThread] isCancelled])
        {
            [NSThread exit];
        }
    }
    NSLog(@"c2 final = %ld",_counter);
}

- (void)actNew:(NSThread *) thread{
    int i = 0;
    while (true) {
        i++;
        if (i >10000) {
            break ;
        }
        _counter++;
        NSLog(@"c1 =%ld" ,_counter);
        
        if ([[NSThread currentThread] isCancelled])
        {
            [NSThread exit];
        }
    }
    NSLog(@"c1 final = %ld",_counter);
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
