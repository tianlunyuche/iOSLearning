//
//  ZXRunLoopVC.m
//  Control
//
//  Created by xinying on 2016/5/18.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXRunLoopVC.h"

typedef void(^RunloopBlock) (void);

@interface ZXRunLoopVC ()

@property(nonatomic,strong)dispatch_source_t runloopTime;

@property(nonatomic,strong)NSMutableArray *tasks;
//最大任务数
@property(nonatomic,assign)NSUInteger maxQueueLength;

@property(nonatomic,strong)UIImageView* imgv;

@end

@implementation ZXRunLoopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"RunLoop运行循环";
    [self setAnimation];
//    [self runloopCreat];
//    [self addRunloop];

    self.navigationItem.hidesBackButton =YES;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_cancel_unfocused"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftItemsSupplementBackButton = YES;
    
//    设置UIImage的渲染模式：UIImage.renderingMode
//
//    着色（Tint Color）是iOS7界面中的一个.设置UIImage的渲染模式：UIImage.renderingMode重大改变，你可以设置一个UIImage在渲染时是否使用当前视图的Tint Color。UIImage新增了一个只读属性：renderingMode，对应的还有一个新增方法：imageWithRenderingMode:，它使用UIImageRenderingMode枚举值来设置图片的renderingMode属性。该枚举中包含下列值：
//
//    UIImageRenderingModeAutomatic  // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
//    UIImageRenderingModeAlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
//    UIImageRenderingModeAlwaysTemplate   // 始终根据Tint Color绘制图片，忽略图片的颜色信息。
//
//    renderingMode属性的默认值是UIImageRenderingModeAutomatic，即UIImage是否使用Tint Color取决于它显示的位置。其他情况可以看下面的图例
//
//
//
//
//    以下的代码说明了使用一个既定的rendering模式创建图片是多么简单：
//
//    UIImage *img = [UIImage imageNamed:@ "myimage" ];
//    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//https://www.cnblogs.com/philipding/archive/2016/03/26/5322581.html
}

- (void)back{
    if (self.runloopTime) {
        dispatch_cancel(self.runloopTime);
    }

    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - setAnimation动画效果
- (void)setAnimation{

    
    
//    _imgv =[[UIImageView alloc] init];
//    _imgv.frame =CGRectMake(30, 100, 80, 80);
//    _imgv.image =[UIImage imageNamed:@"1.png"];
//    [self.view addSubview:_imgv];
    //设置移动按钮
    UIButton* btnMove =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnMove.frame =CGRectMake(120, 360, 80, 40);
    [btnMove setTitle:@"移动" forState:UIControlStateNormal];

    //添加触发事件
    [btnMove addTarget:self action:@selector(preMove) forControlEvents:UIControlEventTouchUpInside];
    //添加视图
    [self.view addSubview:btnMove];
    //设置圆角按钮
    UIButton* btnScale =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnScale.frame =CGRectMake(120, 400, 80, 40);
    [btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    //添加触发事件
    [btnScale addTarget:self action:@selector(preScale) forControlEvents:UIControlEventTouchUpInside];
    //添加视图
    [self.view addSubview:btnScale];
}

- (void)preMove{
    
    
    // 淡出效果
    //    CABasicAnimation *fadeOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    //    [fadeOutAnimation setToValue:[NSNumber numberWithFloat:0.3]];
    //    fadeOutAnimation.fillMode = kCAFillModeForwards;
    //    fadeOutAnimation.removedOnCompletion = NO;
    
    UIImageView *imageViewForAnimation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert_big_icon"]];
    imageViewForAnimation.frame =CGRectMake(20, 130, 60, 60);
    imageViewForAnimation.alpha = 1.0f;
    CGRect imageFrame = imageViewForAnimation.frame;
    //frame.origin，动画开始的地方
    CGPoint viewOrigin = imageViewForAnimation.frame.origin;
    viewOrigin.y = viewOrigin.y + imageFrame.size.height / 2.0f;
    viewOrigin.x = viewOrigin.x + imageFrame.size.width / 2.0f;
    
    imageViewForAnimation.frame = imageFrame;
    imageViewForAnimation.layer.position = viewOrigin;
    [self.view addSubview:imageViewForAnimation];
    
    //设置缩放
//    CABasicAnimation *resizeAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
//    [resizeAnimation setToValue:[NSValue valueWithCGSize:CGSizeMake(40.0f, imageFrame.size.height * (40.0f / imageFrame.size.width))]];
//    resizeAnimation.fillMode = kCAFillModeForwards;
//    resizeAnimation.removedOnCompletion = NO;
    
    // 设置路径运动
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    //设置动画结束点
    CGPoint endPoint = CGPointMake(480.0f - 30.0f, 40.0f);
    //在最后一个选项卡结束动画
    //CGPoint endPoint = CGPointMake( 320-40.0f, 480.0f);
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, viewOrigin.y, endPoint.x, viewOrigin.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setAnimations:[NSArray arrayWithObjects:pathAnimation, nil]];
    group.duration = 1.0f;
    //    group.delegate = self;
    [group setValue:imageViewForAnimation forKey:@"imageViewBeingAnimated"];
    
    [imageViewForAnimation.layer addAnimation:group forKey:@"savingAnimation"];
    
    
    //开始动画函数 ，准备动画的开始工作
//    [UIView beginAnimations:nil context:nil];
//
//
//    [UIView setAnimationDuration:5];
//    //动画开始的 延时 长度，秒
//    [UIView setAnimationDelay:0];
//    //动画的 代理对象
//    [UIView setAnimationDelegate:self];
//
//    //动画运动轨迹的方式 ,   UIViewAnimationCurveEaseInOut,  UIViewAnimationCurveEaseIn,//越来越快
//    //    UIViewAnimationCurveEaseOut, 越来越慢
//    //    UIViewAnimationCurveLinear
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//    //设置动画结果调用的函数
//    [UIView setAnimationDidStopSelector:@selector(stopAmin)];
//    //----动画的实际 目标结果
//    //目标位置
//    _imgv.frame =CGRectMake(150, 300, 160, 120);
//    _imgv.alpha =0.3;
//    //提交运行动画
//    [UIView commitAnimations];
}

- (void)stopAmin{
    ZXLog(@"动画结束了");
}

- (void)preScale{
    //开始动画函数 ，准备动画的开始工作
    [UIView beginAnimations:nil context:nil];
    
    
    [UIView setAnimationDuration:2];
    //动画开始的 延时 长度，秒
    [UIView setAnimationDelay:0];
    //动画的 代理对象
    [UIView setAnimationDelegate:self];
    
    //动画运动轨迹的方式 ,   UIViewAnimationCurveEaseInOut,  UIViewAnimationCurveEaseIn,//越来越快
    //    UIViewAnimationCurveEaseOut, 越来越慢
    //    UIViewAnimationCurveLinear
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    //设置动画结果调用的函数
    [UIView setAnimationDidStopSelector:@selector(stopAmin)];
    //----动画的实际 目标结果
    //目标位置
    _imgv.frame =CGRectMake(50, 150, 60, 60);
    _imgv.alpha =0.3;
    //提交运行动画
    [UIView commitAnimations];
}


#pragma mark - RunLoop 运行循环 ,2个模式 各包含了 Observer观察者，源source和 时钟timer
/**
 作用：1. 保证程序不退出！ 它是一个死循环！
 2. 负责监事件， 触摸 ，时钟，网络事件，（系统事件，内核事件）
 3. 如果没有事件，就进入睡眠
 4. 在一次循环中，需要绘制 所有屏幕上的点！
 
 Runloop 模式：
 1， NSDefaultRunLoopMode默认模式
 2， UITrackingRunLoopMode用户交互模式（只要有用户交互事件 ！！Runloop就会切换到这个模式）
 3， NSRunLoopCommonModes占位模式（占有了上面 两种模式）
 
 
 线程：
 1，每一条线程 上面都有一个 runloop
 2，主线程 不会挂掉的原因 是。主线程的 Runloop 正在跑 run
 3，子线程 ，上面的 Runloop默认不启动 ！所以子线程 执行完后 就会挂掉
 
 性能优化： 耗时操作放 子线程 ， 更新UI 放主线程 ， UI数据分布加载
 
 //
 不可逆运算， 数据
 */
- (void)runloopCreat{
    //创建一个队列
    self.runloopTime =dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    //GCD的时间参数
    dispatch_time_t start =DISPATCH_TIME_NOW;
    //每8秒就 打印一次
    dispatch_time_t interval =8* NSEC_PER_SEC;
    
    dispatch_source_set_timer(self.runloopTime, start, interval, 0);
    
    //设置定时器回调
    dispatch_source_set_event_handler(self.runloopTime, ^{
        ZXLog(@"---------------%@",[NSThread currentThread]);
        [self preMove];
        [self preScale];

    });
    //启动定时器
    dispatch_resume(self.runloopTime);
    
    
    //    NSThread  * thread  = [[NSThread  alloc ]  initWithBlock:^ {
    //        NSTimer *timer =[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    //        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    //
    //        //让子线程的Runloop
    //    }]
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.runloopTime) {
        dispatch_cancel(self.runloopTime);
    }
}

- (void)addRunloop{
    
    [self addRunloopObserver];
    
    //    _timer =[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    _maxQueueLength =20;
    _tasks =[NSMutableArray array];
}

- (void)addTasks:(RunloopBlock)task{
    //保存新的任务
    [self.tasks addObject:task];
    //干掉之前任务
    if(self.tasks.count >self.maxQueueLength){
        [self.tasks removeObjectAtIndex:0];
    }
}


//回调
static void Callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity,void *info){
    ZXLog(@"此处%@ 执行 你想要的操作%@",observer,[NSThread currentThread]);
    //1, 拿到控制器对象
    //    ViewController *vc=(__bridge ViewController *)info;
    //    if (vc.tasks.count ==0) {
    //        return;
    //    }
    //    //2, 从数组里面取出任务
    //    RunloopBlock task =vc.tasks.firstObject;
    //    //3, 执行
    //    task();
    //    //4, 干掉已经执行完毕的任务
    //    [vc.tasks removeObjectAtIndex:0];
}

- (void)addRunloopObserver{
    
    //1,获取当前Runloop
    CFRunLoopRef runloop =CFRunLoopGetCurrent();
    //2, 创建观察者  ，定义上下文
    CFRunLoopObserverContext context ={
        
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    
    //2.1 定义观察者
    static CFRunLoopObserverRef defaultModeObserver;
    //2.2 创建观察者
    defaultModeObserver =CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0, &Callback, &context);
    
    //3. 给当前 Runloop添加观察者
    CFRunLoopAddObserver(runloop, defaultModeObserver, kCFRunLoopCommonModes);
    //释放，防止内存泄漏
    CFRelease(defaultModeObserver);
    
}



- (void)dealloc{
    
//    dispatch_cancel(self.runloopTime);
    self.runloopTime =nil;
    _imgv =nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
