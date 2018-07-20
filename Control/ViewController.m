//
//  ViewController.m
//  Control
//
//  Created by xinying on 2016/1/14.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ViewController.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "TableViewController.h"
#import <CoreMotion/CoreMotion.h>
//#import <ReactiveObjC/ReactiveObjC.h>

#import "LoopQueue.h"
//定位服务 ,地图
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
//大头针
#import "ZXAnnotation.h"
#import "ZXCalloutAnnotatonView.h"
#import "ZXAlert.h"

#import <Social/Social.h>

//#import <ReactiveCocoa/ReactiveCocoa.h>


//#import "MBProgressHUD.h"

#define kscreen [UIScreen mainScreen].bounds.size

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>
//<UITextFieldDelegate ,UIAlertViewDelegate,UITabBarControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property(strong,nonatomic)CMMotionManager *motionManager;

@property(assign,nonatomic,getter=isFinish)BOOL finish;

@property (strong, nonatomic)CLGeocoder *geocoder;

@property(strong,nonatomic) MKMapView *mapView;


@end


@implementation ViewController

//属性和 成员变量同步
@synthesize mySwitch =_mySwitch;
@synthesize textField =_textField;
@synthesize alerView =_alerView;
@synthesize activityIndicatorView =_activityIndicatorView;
@synthesize stepper =_stepper;
@synthesize segControl =_segControl;
@synthesize slider=_slider;
@synthesize progressView =_progressView;
@synthesize timer =_timer   ;

@synthesize motionManager;

//视图控制器 初始化
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self =[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self UITapGestureRecognizerCreate];
//    [self setTimeCreat];
//    [self UISwitchCreat];
//    [self textFieldCreat];
//    [self UIAlertViewCreat];
//    [self UIProgressViewCreat];
//    [self UISliderCreat];
//     [self UIStepperSreat];
//    [self setTimeCreat];
//    [self UIPickerViewCreat];
//    [self NSThreadCreat];
//    [self setAnimation];
    
//    [self NSOperationQueueCreat];
    
//     声音和视频
//    [self creatAVPlayer];
//    [self playAV];
//      [self playNotifySound];
    
//    [self creatVieo];
//    [self tablebarCreat];
 
//    [self audio];
//    [self nssetcreat];
    
//    [self Toolbar];
//    [self SearchBar];
//    [self strReplace];
//    [self WebImageCreat];
    
//    [self UISwitchCreat];
//    [self controlHardware];
//    [self QRcodeCreat];
//    [self runloopCreat];
//    [self NSNotificationCenterCreat];
//    [self creatMusic];
//    [self creatVieo];
//    [self Creatgeocoder];
//      [self CreatMap];
//    [self CreatMyMap];
//    [self UIAlertViewCreat];
//    [self PanGesture];
//    [self threadCommunication];

}
#pragma mark - 图像处理

//图像翻转
//    CGContextScaleCTM( in, d, d)
//图像平移
//UIImageView *iv =kImgV(@"1");
//    iv.transform =CGAffineTransformMakeTranslation(<#CGFloat tx#>, <#CGFloat ty#>)
//    图像缩放
//    iv.transform =CGAffineTransformScale(<#CGAffineTransform t#>, <#CGFloat sx#>, <#CGFloat sy#>)

#pragma mark - 手势识别

- (void)PanGesture{
    
//    UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    _imageView =kImgV(@"green_button_n");
    _imageView.frame =CGRectMake(10, 100, 100, 30);
    _imageView.userInteractionEnabled=YES;
    [self.view addSubview:_imageView];
    
    UISwipeGestureRecognizer *left= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    left.numberOfTouchesRequired =1;
    [left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_imageView addGestureRecognizer:left];
    
    UISwipeGestureRecognizer *rightRecognizer= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    rightRecognizer.numberOfTouchesRequired =1;
    [rightRecognizer setDirection: UISwipeGestureRecognizerDirectionRight];
    [_imageView addGestureRecognizer:rightRecognizer];
}

- (void)handlePan:(UISwipeGestureRecognizer *)sender{
//    
//    CGPoint point =[rec translationInView:self.view];
//    NSLog(@"%f  ,%f",point.x ,point.y);
//    rec.view.center =CGPointMake(rec.view.center.x +point.x, rec.view.center.y +point.y);
//    [rec setTranslation:CGPointMake(0, 0) inView:self.view];
    CATransition *transition =[CATransition animation];
    transition.type =kCATransitionReveal;
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
  
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];

        
        [_imageView setFrame:CGRectMake(_imageView.frame.origin.x-sender.view.center.x, _imageView.frame.origin.y, _imageView.frame.size.width, _imageView.frame.size.height)];
         NSLog(@"sender.view.center.x =%f",sender.view.center.x);
        [UIView commitAnimations];
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
    
//         transition.subtype = kCATransitionFromLeft;
//        [_imageView.layer addAnimation:transition forKey:nil];
////        [_imageView setFrame:CGRectMake(_imageView.frame.origin.x+50, _imageView.frame.origin.y, _imageView.frame.size.width, _imageView.frame.size.height)];
//         NSLog(@"%@",transition);
//            [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        [_imageView setFrame:CGRectMake(_imageView.frame.origin.x +sender.view.center.x, _imageView.frame.origin.y, _imageView.frame.size.width, _imageView.frame.size.height)];
        NSLog(@"%f",sender.view.center.x);
        [UIView commitAnimations];
        }
    
    NSLog(@"%ld",sender.direction);

}

#pragma mark - 打开加速计和 陀螺仪

- (void)controlHardware{
    
    self.motionManager =[[CMMotionManager alloc] init];
    
    
    [_mySwitch removeTarget:self action:@selector(swChage:) forControlEvents:UIControlEventValueChanged];
    [_mySwitch addTarget:self action:@selector(HardwareOpen:) forControlEvents:UIControlEventValueChanged];
}

//将开关对象本身 作为参数 传入
- (void)HardwareOpen:(UISwitch *) sw{
    
    if ([sw isOn]) {
        
    }
}

#pragma mark - 在web视图 中加载 html路径的图片
- (void)WebImageCreat{
    
    NSString *outputHtml =[[NSString alloc ] initWithFormat:@"<body style='margin: 0px; padding:0px'><img height='1200' src='http://www.floraphotographs.com/showrandom.php?color=%@'></body>" ,@"red"];
    UIWebView *flowerview =[[UIWebView alloc] initWithFrame:CGRectMake(0, 20, kscreen.width -100, kscreen.height -100)];
    [self.view addSubview:flowerview];
    
    [flowerview loadHTMLString:outputHtml baseURL:nil];
}


#pragma  mark - 多行编辑框UITextView 中的字符替换
- (void)strReplace{
    
    _textField =[[UITextField alloc] initWithFrame:CGRectMake(10,400,kscreen.width -50 , 40)];
    _textField.backgroundColor =[UIColor grayColor];
    
    self.textview =[[UITextView alloc] initWithFrame:CGRectMake(10, 50, kscreen.width -50, 300)];
    self.textview.text=@"hello man ,are you ready?I will play with you.you should ready.";
    self.textview.backgroundColor =[UIColor grayColor];
    self.textview.tintColor =[UIColor redColor];
    
    UIButton *replaceBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    replaceBtn.frame =CGRectMake(100, 500, 80, 40);
    [replaceBtn setTitle:@"替换" forState:UIControlStateNormal];
    [replaceBtn setTintColor:[UIColor blackColor]];
    replaceBtn.backgroundColor =[UIColor redColor];
    //给按钮添加 事件
    [replaceBtn addTarget:self action:@selector(replace) forControlEvents:UIControlEventTouchUpInside];
    
    //添加按钮
    [self.view addSubview:replaceBtn];
    [self.view addSubview:_textField];
    [self.view addSubview:self.textview];

}

- (void)replace{
    
    self.textview.text =[self.textview.text stringByReplacingOccurrencesOfString:@"ready" withString:_textField.text];
    
}

// 屏幕 4个方向都适应
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return  YES;
}



#pragma mark - UISearchBar 创建
// 保存原始表格数据的NSArray对象。
NSArray * tableData;
// 保存搜索结果数据的NSArray对象。
NSArray* searchData;
bool isSearch;

- (void)SearchBar{

    isSearch = NO;
    // 初始化原始表格数据
    tableData = [NSArray arrayWithObjects:@"Java工程师",
                 @"Android工程师",
                 @"HTML5工程师",
                 @"iOS初级工程师",
                 @"iOS中级工程师",
                 @"iOS高级工程师", nil];
    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kscreen.width, kscreen.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self.view addSubview:_tableView];
    
    // 设置UITableView控件的delegate、dataSource都是该控制器本身
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, 50, kscreen.width, 80)];
    _searchBar.placeholder=@"输入搜索内容";
    _searchBar.showsScopeBar =YES;
    _searchBar.scopeButtonTitles =@[@"ios",@"android",@"html" ];
//    [self.view addSubview:_searchBar];
    _tableView.tableHeaderView =_searchBar;
    
    // 设置搜索条的delegate是该控制器本身
    _searchBar.delegate = self;
    
    // 用 searchbar 初始化 SearchDisplayController
    // 并把 searchDisplayController 和当前 controller 关联起来
    _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    
    // searchResultsDataSource 就是 UITableViewDataSource
    _searchDisplayController.searchResultsDataSource = self;
    // searchResultsDelegate 就是 UITableViewDelegate
    _searchDisplayController.searchResultsDelegate = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //如果处于搜索状态
    if(isSearch){
        //使用 searchData 作为表格显示的 数据
        return searchData.count;
    }else{
        return tableData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellId =@"cellId";
    UITableViewCell* cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    //如果表格 行 为ni
    if(!cell){
        
        //创建表格行
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //获取当前 表格行号
    NSInteger rowNo =indexPath.row;
    //如果处于搜索状态
    if(isSearch){
        //
        cell.textLabel.text = [searchData objectAtIndex:rowNo];
    }
    else{
        // 否则使用原始的tableData作为表格显示的数据
        cell.textLabel.text = [tableData objectAtIndex:rowNo];
    }
    return cell;
}

// UISearchBarDelegate定义的方法，用户单击取消按钮时激发该方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    //
    isSearch =NO;
    [_tableView reloadData];
}

//当搜索文本框内文本改变时激发该方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //调用 filterBySubstring方法 执行搜索
    [self filterBySubstring:searchText];
}

//用户单击虚拟键盘上Search按键时激发该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchBar.text];
    // 放弃作为第一个响应者，关闭键盘
    [searchBar resignFirstResponder];
}

- (void)filterBySubstring:(NSString * )subStr{
    //设置搜索状态
    isSearch =YES;
    //定义搜索 谓词
    NSPredicate* pred =[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",subStr];
    //使用谓词 过滤NSArray
    searchData =[tableData filteredArrayUsingPredicate:pred];
    //让表格控件 重新 加载数据
    [_tableView reloadData];
}



#pragma mark - Toolbar 创建 ，scrollView 滚动视图

#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

#define IMGBARBUTTON(IMAGE, SELECTOR) [[UIBarButtonItem alloc] initWithImage:IMAGE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

#define SYSBARBUTTON(ITEM, SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:ITEM target:self action:SELECTOR]

#define CUSTOMBARBUTTON(VIEW) [[UIBarButtonItem alloc] initWithCustomView:VIEW]


- (void)Toolbar{
    self.view.backgroundColor =[UIColor whiteColor];
    //初始化
    
    UIToolbar *tb = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f,kscreen.width, 44.0f)];
    
    tb.center = CGPointMake(kscreen.width /2, kscreen.height -100);
    
    //初始化items
    NSMutableArray *tbitems = [NSMutableArray array];
    
    //添加items
    [tbitems addObject:BARBUTTON(@"Title", @selector(action))];
    [tbitems addObject:SYSBARBUTTON(UIBarButtonSystemItemAdd, @selector(action))];
    [tbitems addObject:IMGBARBUTTON([UIImage imageNamed:@"alert"], @selector(action))];
    [tbitems addObject:CUSTOMBARBUTTON([[UISwitch alloc] init] )];
    [tbitems addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
    [tbitems addObject:IMGBARBUTTON([UIImage imageNamed:@"rll_progress"], @selector(action))];
    
    
    // 添加fix
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil] ;
    bbi.width = 20.0f;
    
    [tbitems addObject:bbi];
    
    //把items赋给toolbar
    
    tb.items = tbitems;
    //
    [self.view addSubview:tb];
    
    //  scrollView 滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(847, 1129);//滚动条视图内容范围的大小
    scrollView.showsHorizontalScrollIndicator = FALSE;//水平滚动条是否显示
    scrollView.showsVerticalScrollIndicator = FALSE;//垂直滚动条是否显示
    UIImage *image = [UIImage imageNamed:@"1"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
}

- (void) action
{
    [self.navigationController pushViewController:[[TableViewController alloc] init] animated: YES];
}

#pragma mark -  UIVisualEffectView  模糊特效
- (void)VisualEffect{
//1。实现UIBlurEffect类型的毛玻璃效果
    
    /** 1. 创建UIImageView的对象blurImageView. */
    UIImageView *blurImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2 * self.view.frame.size.width, self.view.frame.size.height)];
    
    UIImage *image = [UIImage imageNamed:@"5"];
    
    blurImageView.image = image;
    
    [self.view addSubview:blurImageView];
    
    
    /** 2. 创建UILable的对象. */
    
    UILabel *blurLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, self.view.frame.size.width - 60, 300)];
    
    blurLabel.text = @"UIVisualEffectView 毛玻璃特效 有点像打了 马赛克是不是";
    
    /** 设置blurLabel的最大行数. */
    blurLabel.numberOfLines = 30;
    
    /** 设置blurLabel的字体颜色. */
    blurLabel.textColor = [UIColor whiteColor];
    
    /** 设置blurLabel的字体为系统粗体, 字体大小为34. */
    blurLabel.font = [UIFont boldSystemFontOfSize:34];
    
    // 创建UIBlurEffect类的对象blur, 参数以UIBlurEffectStyleLight为例.
    UIBlurEffect* blur =[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    /** 创建UIVisualEffectView的对象visualView, 以blur为参数. */
    UIVisualEffectView * visualView = [[UIVisualEffectView alloc] initWithEffect:blur];
    /** 将visualView的大小等于blurImageView的大小. (visualView的大小可以自行设定, 它的大小决定了显示毛玻璃效果区域的大小.) */
    visualView.frame = blurImageView.bounds;
    //设置 模糊的 透明程度
    visualView.alpha =0.8;
    
    [blurImageView addSubview:visualView];
    
    [visualView.contentView addSubview:blurLabel];
    
}

//2。实现UIVibrancyEffect类型的毛玻璃效果
- (void)VibrancyEffect{
    //    * UIImageView的属性imgae的渲染方式要选择UIImageRenderingModeAlwaysTemplate, 会获得更好的效果.
    UIImageView *vibrancyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2 * self.view.frame.size.width, self.view.frame.size.height)];
    
    UIImage *image = [UIImage imageNamed:@"5"];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    vibrancyImageView.image =image;
    vibrancyImageView.userInteractionEnabled =YES;
    
    [self.view addSubview:vibrancyImageView];
    
    /** 2. 创建UILable的对象. */
    UILabel *vibrancyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, self.view.frame.size.width - 20, 300)];
    
    vibrancyLabel.text = @"UIVisualEffectView 毛玻璃特效,很不一样 ";
    vibrancyLabel.numberOfLines = 5;
    vibrancyLabel.textColor = [UIColor blueColor];
    vibrancyLabel.font = [UIFont boldSystemFontOfSize:34];
    
     UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur];
    
    /** 下面的步骤同上. */
    UIVisualEffectView * visualView = [[UIVisualEffectView alloc] initWithEffect:vibrancy];
    
    visualView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    visualView.alpha = 1;
    
    [vibrancyImageView addSubview:visualView];
    [visualView.contentView addSubview:vibrancyLabel];
    
}


#pragma mark - 集合 NSSet  ，是无序的集合 ，哈希表
- (void)nssetcreat{
    
    NSMutableSet* set1 =[[NSMutableSet alloc] initWithObjects:@"one",@"two",@"three",nil, nil];
    NSMutableSet* set2 =[[NSMutableSet alloc] initWithObjects:@"two",@"5",@"6",nil, nil];
    //添加元素
    [set1 addObject:@"four"];
    //删除
    [set1 removeObject:@"four"];
    
    
    //取并集
    [set1 unionSet:set2];
    NSLog(@"set1 =%@",set1);
    //取交集
    [set1 intersectSet:set2];
    NSLog(@"set1 =%@",set1);
    //取差集 ，set1 返回为 set1删去 与set2相同的元素
    [set1 minusSet:set2];
    NSLog(@"set1 =%@",set1);
    
    //求集合元素个数
    NSSet* set =[[NSSet alloc] initWithObjects:@"one",@"two",@"three",nil];
    NSLog(@"count =%ld",[set count]);
    //求两个集合是否相等
    if ([set isEqualToSet:set2]){
        NSLog(@"香等");
    }else{
        NSLog(@"不等");
    }
    //判断集合是否 拥有 元素@"two"
    if ([set containsObject:@"two"]) {
        NSLog(@"有");
    }else{
        NSLog(@"无");
    }
    //判断set是否 是set2 的子集合
    if ([set isSubsetOfSet:set2]) {
        NSLog(@"是 子集合");
    }else NSLog(@"不是");
    //集合也可以用枚举器来遍历
    NSEnumerator*  enumerator =[set objectEnumerator];
    NSString* str;
    while (str =[enumerator nextObject]) {
        NSLog(@"str =%@",str);
    }
    
    //数组 转成 集合
    NSArray* array =[[NSArray alloc] initWithObjects:@"hello",@"666",@"hi",@"888",@"6868", nil];
    NSLog(@"array ->  nsset =%@",[[NSSet alloc] initWithArray:array]);
    //集合 转成 数组
    NSArray* array2 =[set allObjects];
    NSLog(@"nsset -> array2 =%@",array2);
    
    //取集合中 连续的元素 , (指数集合)索引集合（ 从 下标2开始 取3个数）
    NSIndexSet* indexSet =[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(2, 3)];
    NSArray* newArray =[array objectsAtIndexes:indexSet]; //返回
    NSLog(@"indexSet =%@",indexSet);
    NSLog(@"newArray =%@",newArray);
    
    //创建可变索引集合
    NSMutableIndexSet* indexS =[[NSMutableIndexSet alloc] init];
    [indexS addIndex:0];
    [indexS addIndex:3];
    NSLog(@"indexS =%@",indexS);
}


#pragma mark - 跑步内容
/**
- (void)timerCount{
    
    
}

- (void)startBtnClick{  //开始</span>
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.count = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(repeatShowTime:) userInfo:@"admin" repeats:YES];
}

- (void)stopBtnClick {  //停止</span>
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.count = 0;
    self.timerLabel.text = @"00:00";
}

- (void)pauseBtnClick{   //暂停</span>
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)continueClick{   //继续</span>
    [self.timer setFireDate:[NSDate date]];
}

- (void)repeatShowTime:(NSTimer *)tempTimer {
    
    self.count++;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02d:%02d",self.count/60,self.count%60];
}  

- (void)dealloc {   //销毁NSTimer</span>  
    if (self.timer) {  
        [self.timer invalidate];  
        self.timer = nil;  
    }  
}


#pragma mark - 用数据视图 加载网络 图片和json

- (void)tablebarCreat{
    
    self.title =@"加载网络图片文字 demo";
    _tableView =[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //
    _tableView.delegate =self;
    _tableView.dataSource =self;
    //
    _tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_tableView];
    
//    数据数组
    _arrayData =[[NSMutableArray alloc] init];
    

    
//    for (int i =0; i<10; i++) {
//        NSString * str =[NSString stringWithFormat:@"data %d",i];
//        
//        [_arrayData addObject:str];
//    }
    //加载数据视图 按钮
    _btnLoadData =[[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(pressLoad)];
    self.navigationItem.rightBarButtonItem =_btnLoadData;
    
}

- (void)pressLoad{
//    static int i =0;
//    for (i=0; i<10 ; i++) {
//        NSString* str =[NSString stringWithFormat:@"数据%d",i+1];
//        [_arrayData addObject:str];
//    }
    [self loadDataFromNet];

}

//
- (void)loadDataFromNet{
    NSLog(@"hello");
    //下载网络数据
    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
    session.requestSerializer =[AFHTTPRequestSerializer serializer];
    //设置响应序列化,AFJSONResponseSerializer
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    //缺少这一句可能会有error
    session.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/plain",@"image/png",nil];
    NSArray* arrayG =[NSArray arrayWithObjects:@"C++",@"Android",@"php",nil];
    
    static int counter =0;
    
    NSString* path =[NSString stringWithFormat:@"api.douban.com/book/subjects?q=%@&alt=json&apikey=01987f93c544bbfb04c97ebb4fce33f1",arrayG[counter++]];
    NSLog(@"path =%@",path);
    if(counter >=3){
        counter =0;
    }
    
    [session GET:@"http://api.douban.com/book/subjects?q=C++&alt=json&apikey=01987f93c544bbfb04c97ebb4fce33f1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功！");
        NSLog(@"dict =%@",responseObject);
        if([responseObject isKindOfClass:[NSDictionary class]]){
            [self parseData:responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error =%@",error);
    }];
}
//解析数据函数
- (void)parseData:(NSDictionary *)dicData{
    NSLog(@"FDFDF");
    NSArray* arrEntry =[dicData objectForKey:@"entry"];
    for (NSDictionary* dicBook in arrEntry) {
        NSDictionary* dicTitle =[dicBook objectForKey:@"title"];
        NSLog(@"dicTitle =%@",dicTitle);
        NSString* strTitle =[dicTitle objectForKey:@"$t"];
        //创建一个书模型
        BookModel* bModel =[[BookModel alloc] init];
        //获取书名
        bModel.mBookName =strTitle;
        NSLog(@"bModel.mBookName =%@",bModel.mBookName);
        NSArray* arrLink =[dicBook objectForKey:@"link"];
        for(NSDictionary* dicLink in arrLink){
            NSString*  sValue =[dicLink objectForKey:@"@rel"];
            if ([sValue isEqualToString:@"image"]){
                bModel.mImageURL =[dicLink objectForKey:@"@href"];
            }
        }
        [_arrayData addObject:bModel];
        NSLog(@"_arrayData =%@",_arrayData);
    }
    //单元格重新更新数据
    [_tableView reloadData];
}

//行数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrayData.count;
}

//行数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* strID =@"ID";
    
    UITableViewCell* cell =[_tableView dequeueReusableCellWithIdentifier:strID];
    if (cell ==nil){
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    BookModel* bModel =_arrayData[indexPath.row];
    cell.textLabel.text =bModel.mBookName;
    
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:bModel.mImageURL] placeholderImage:[UIImage imageNamed:@""]];
    NSLog(@"str =%@",bModel);
    return cell;
}
//单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 80;
}
**/


#pragma mark - 系统提示音
- (void)playNotifySound{
    
    //获取路径
    NSString *path =[[NSBundle mainBundle] pathForResource:@"许巍 - 温暖" ofType:@"mp3"];
    //定义一个 系统声音id
    SystemSoundID soundID;
    //判断路径是否存在
    if(path){
        
        CFURLRef inFileURL  = (CFURLRef)CFBridgingRetain([NSURL fileURLWithPath:path]);
        //创建一个音频文件 的播放系统声音服务器
        OSStatus error =AudioServicesCreateSystemSoundID(inFileURL, &soundID);
        
        //判断是否有错误
        if(error !=kAudioServicesNoError){
            NSLog(@"%d",(int)error);
            return;
        }
        //1,  播放声音 和振动
        AudioServicesPlayAlertSoundWithCompletion(soundID, ^{
            //播放成功回调
            NSLog(@"播放成功回调");
        });
//        //2 ,只播放声音，没振动
//        AudioServicesPlaySystemSound(soundID);
//        //3,  手机只振动没声音
//        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }

    
}



#pragma mark - NSOperationQueue 任务队列(放执行体) 是对 线程的 分装 ，NSInvocationOperation任务执行体
- (void)NSOperationQueueCreat{
    
    for(int i =0;i <2;i++){
        UIButton* btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame =CGRectMake(100, 100+80*i, 160, 40);
        
        [btn addTarget:self action:@selector(presBt:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag =101 +i;
        if (i ==0){
            [btn setTitle:@"添加新任务1 到队列中" forState:UIControlStateNormal];
        }
        else if (i ==1){
            [btn setTitle:@"添加新任务2 到队列中" forState:UIControlStateNormal];
        }
        [self.view addSubview:btn];
    }
    
    
    //----实例化 任务队列
    _queue =[[NSOperationQueue alloc] init];
    //设置最大并发任务的数量
    [_queue setMaxConcurrentOperationCount:5];
}

- (void)presBt:(UIButton *)btn{
    
    if(btn.tag ==101){
        //，方法一
        //创建一个执行任务。
        //p1 任务函数的拥有者 ，p2 任务函数的执行体 ，p3任务参数
        NSInvocationOperation* iop =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(opAct1:) object:@"OPT01"];
        [_queue addOperation:iop];
        
        //方法二 来实现任务
//        NSInvocation* invo =[[NSInvocation alloc] init];
//        invo.target =self;
//        invo.selector =@selector(opAct1:);
//        
//        NSInvocationOperation* iop2 =[[NSInvocationOperation alloc] initWithInvocation:invo];
//        [_queue addOperation:iop2];
    }
    else if(btn.tag ==102){
        
        //使用block语法块 来进行任务处理
        [_queue addOperationWithBlock:^{
            while (true) {
                NSLog(@"Block opt !");
            }
        }];
    }
}

-  (void)opAct1:(NSInvocationOperation*)iop{
    for (int i=0;i <1000; i++) {
          NSLog(@" Opt2 !");
    }
}
#pragma mark -  UIPickerView 选择视图创建 ，实现地区地址，生日，日历选择等功能

- (void)UIPickerViewCreat{
    //实现地区地址，生日，日历选择等功能
    UIPickerView* pickView =[[UIPickerView alloc] init];
    //设置选择视图的位置和大小
    pickView.frame =CGRectMake(10, 100, 400, 400);
    
    pickView.delegate =self;
    pickView.dataSource =self;
    //添加pickView视图
    [self.view addSubview:pickView];
}

//实现获取组数的协议函数， 返回 选择视图 的组数
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //组数3
    return 3;
}
//每组元素的个数 ，有多少行 ，p2 为第几组的元素个数
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    if (component == 0){
        return 5;
    }
    else if(component ==1){
        return 10 ;
    }
    else if(component ==2){
        return 20;
    }
    //每组10个元素
    return 10;
}
//显示每个元素的内容
//p1 调用此协议的选择视图 本身， p2 行数，p3组数
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString* str =[NSString stringWithFormat:@"第%ld组 第 %ld 行 ",component+1 ,row +1];
    return str;
}

//设置每行 元素的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
  
    return 50;
}

//将自定义的视图 显示到 屏幕上
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //1~ 7.png七张图 轮流显示
    UIImage* image =[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",(row)%7 +1]];
    
    UIImageView* iView =[[UIImageView alloc] initWithImage:image];
    
    iView.frame =CGRectMake(0, 0, 100, 100);
    
    return iView;
}

#pragma mark - UITabBarControllerDelegate分栏控制器代理协议

- (void)UITabBarControllerCreat{
    //创建控制器
    FirstVC* vcFirst =[[FirstVC alloc] init];
    vcFirst.view.backgroundColor =[UIColor blueColor];
    
    SecondVC* vcSecond =[[SecondVC alloc] init];
    vcSecond.view.backgroundColor =[UIColor yellowColor];
    
    ThirdVC* vcThird =[[ThirdVC alloc] init];
    vcThird.view.backgroundColor =[UIColor purpleColor];
    
    //创建分栏控制器
    UITabBarController* tbControl =[[UITabBarController alloc] init];
    
    //创建一个控制器数组对象
    NSArray* arrayVC =[NSArray arrayWithObjects:vcFirst ,vcSecond ,vcThird, nil];
    
    //分栏视图控制器 管理该数组 控制器
    tbControl.viewControllers =arrayVC;
    
    //设置当前被选中的视图控制器 索引
    tbControl.selectedIndex =2;
    
    if (tbControl.selectedViewController ==vcThird){
        NSLog(@"当前显示的是控制器3");
    }
    
    //设置工具栏的透明度
    tbControl.tabBar.translucent =NO;
    
    //创建3个 工具栏按钮
    UIBarButtonItem* btn1 =[[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem* btn2 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    //自定义按钮
    UIButton* btnImage =[UIButton buttonWithType:UIButtonTypeCustom];
    [btnImage setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    btnImage.frame =CGRectMake(0, 0, 60, 60);
    UIBarButtonItem* btn3 =[[UIBarButtonItem alloc] initWithCustomView:btnImage];
    
    //固定宽度占位按钮
    UIBarButtonItem* btnF1 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    btnF1.width =20;
    //创建自动计算宽度按钮
    UIBarButtonItem* btnf2 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //工具栏按钮数组
    NSArray* arrayBtns =[NSArray arrayWithObjects:btn1,btnF1,btn2 ,btnf2,btn3, nil];
    
    self.navigationController.toolbarItems =arrayBtns;
    
//    [self presentViewController:tbControl animated:YES completion:nil];
    
}


- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    NSLog(@"编辑前");
}



- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    NSLog(@"即将结束前！");
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    NSLog(@"已经结束编辑！");
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"选中控制器对象");
}

#pragma mark - UISlider 滑动条
- (void)UISliderCreat{
    
    _slider =[[UISlider alloc] init];
    _slider.frame =CGRectMake(50, 250, 200, 40);
    _slider.maximumValue =100;
    _slider.value =30;
    //左侧滑条背景颜色
    _slider.minimumTrackTintColor =[UIColor blueColor];
    //右侧滑条背景颜色
    _slider.maximumTrackTintColor =[UIColor greenColor];
    //设置滑块的颜色
    _slider.thumbTintColor =[UIColor blackColor];
    
    _slider.minimumValueImage =[UIImage imageNamed:@"alert"];
    _slider.maximumValueImage =[UIImage imageNamed:@"alert"];
    
    //给滑动条添加事件
    [_slider addTarget:self action:@selector(SliderBtn) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];

}

- (void)SliderBtn{
    _progressView.progress =(_slider.value -_slider.minimumValue) / (_slider.maximumValue -_slider.minimumValue);
    NSLog(@"vlaue =%f" ,_slider.value);
}

#pragma mark - UIProgressView 进度条
- (void)UIProgressViewCreat{
    
    _progressView =[[UIProgressView alloc] init];
    //位置宽度可以设置，高度无法改变
    _progressView.frame =CGRectMake(50, 200, 200, 40);
    //进度条的颜色
    _progressView.progressTintColor =[UIColor redColor];
    //左侧进度条颜色
    _progressView.trackTintColor =[UIColor blueColor];
    //进度条风格特征
    _progressView.progressViewStyle =UIProgressViewStyleDefault;
    
    //当前进度值， 范围0～1
    _progressView.progress =0.5;
    
    [self.view addSubview:_progressView];
}



#pragma mark -  UISegmentedControl分段控制器
- (void)UISegmentedControlCreat{
    _segControl.frame =CGRectMake(10, 200, 300, 40);
    //添加按钮元素 ,标题，索引值，和动画设置
    [_segControl insertSegmentWithTitle:@"0" atIndex:0 animated:YES];
    [_segControl insertSegmentWithTitle:@"5" atIndex:1 animated:YES];
    [_segControl insertSegmentWithTitle:@"10" atIndex:2 animated:YES];
    
    //设置当前默认的索引
    _segControl.selectedSegmentIndex =0;
    [_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segControl];
}

- (void)segChange{
    NSLog(@"%ld" ,_segControl.selectedSegmentIndex);
}

#pragma mark -  UIStepper步进器

- (void)UIStepperSreat{
    
    _stepper =[[UIStepper alloc] init];
    //设置位置，宽高无法改变
    _stepper.frame =CGRectMake(100, 100, 80, 40);
    
    //设置最小值和最大值
    _stepper.minimumValue =0;
    _stepper.maximumValue =100;
    
    //设置初始值
    _stepper.value =10;
    //设置每次向后步进的步伐值
    _stepper.stepValue =1;
    
    //是否可以重复响应事件操作
    _stepper.autorepeat=YES;
    //是否将步进结果 通过事件响应 ，当autorepeat为yes时才起作用
    _stepper.continuous =YES;
    
    //给步进器添加事件
    [_stepper addTarget:self action:@selector(stepChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
}

- (void)stepChange:(UIStepper *)stepper{
    //步进器的值为浮点类型
    NSLog(@"%f ",stepper.value);
}



#pragma mark - UIAlertView警告提示框和 等待状态显示

- (void)UIAlertViewCreat{
    
    for ( int i=0 ; i<2; i++) {
        UIButton* btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame =CGRectMake(150, 100+100*i, 100, 40);
        
        if(i ==0){
            [btn setTitle:@"提示框" forState:UIControlStateNormal];
        }
        else if (i ==1){
            [btn setTitle:@"等待指示器" forState:UIControlStateNormal];
        }
        btn.tag =101+i;
        [btn addTarget:self action:@selector(alertBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _alerView.delegate =self;
    }
}

- (void)alertBtn:(UIButton *)btn{
    //提示对话框创建
    if(btn.tag ==101){
        //otherButtonTitles添加其他按钮
//        _alerView =[[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要退出吗？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"ok",@"等会",@"考虑下", nil];
//        //显示提示框
//        [_alerView show];
        ZXAlert *alert =[ZXAlert alertControllerWithTitle:@"是否进入轨迹\n\n\n" message:@"活动已结束，是否进入查看轨迹页面ooooooo" preferredStyle:UIAlertControllerStyleAlert];
        [alert.view addSubview:kImgV(@"alert")];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"确定");
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"取消");
        }]];
        //        [cancelAction setValue:[UIColor lightGrayColor] forKey:@"titleTextColor"];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else if( btn.tag ==102){
        //创建等待提示器
        _activityIndicatorView =[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 300, 80, 80)];
        
        //定义提示风格：小灰，小白，大白
        _activityIndicatorView.activityIndicatorViewStyle =UIActivityIndicatorViewStyleGray;
        
        [self.view addSubview:_activityIndicatorView];
        //启动动画并显示
        [_activityIndicatorView startAnimating];
        
        //停止等待动画并隐藏
//        [_activityIndicatorView stopAnimating];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"index =%ld \n" ,buttonIndex);
}
//对话框即将消失
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"即将消失！");
}
//对话框已经消失时，调用此函数
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"已经消失！");
}

#pragma mark -  textField及其代理

- (void)textFieldCreat{
    
    self.textField =[[UITextField alloc] init];
    self.textField.frame =CGRectMake(200, 100, 180, 40);
    self.textField.text =@"用户名";
    self.textField.font =[UIFont systemFontOfSize:20];
    self.textField.textColor =[UIColor blueColor];
    //边框风格
    self.textField.borderStyle =UITextBorderStyleRoundedRect;
    //弹出的键盘风格
    self.textField.keyboardType =UIKeyboardTypeDefault;
    //当text属性为空时，提示文字
    self.textField.placeholder =@"请输入用户名。。。。";
    //是否为密码输入，若是，则为小黑点加密
    self.textField.secureTextEntry =NO;
    
    //添加编辑框
    [self.view addSubview:self.textField];
    //设置编辑框的代理为 该视图控制器
    self.textField.delegate =self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"开始编辑了！");
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"编辑输入结束！");
}

//是否可以进行输入,默认为yes
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
//是否可以结束输入
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
#pragma  mark - UISwitch 开关

- (void)UISwitchCreat{
    //创建开关对象
    _mySwitch =[[UISwitch alloc] init];
    
    //位置可以改变，但是宽高无法改变
    _mySwitch.frame =CGRectMake(100, 300, 80, 40);
    
    //开关状态设置属性
    _mySwitch.on =YES;
    //相当于
    [_mySwitch setOn:YES];
    //开启动画效果
    [_mySwitch setOn:YES animated:YES];
    //添加按钮
    [self.view addSubview:_mySwitch];
    
    //设置开启时的风格颜色
    [_mySwitch setOnTintColor:[UIColor orangeColor]];
    //设置 开关 圆按钮的颜色/Volumes/Data/ios_projects/OC学习/Control/Control
    [_mySwitch setThumbTintColor:[UIColor greenColor]];
    
    //设置整体风格颜色（跟上面2个方法有关）
    [_mySwitch setTintColor:[UIColor purpleColor]];
    
    //向开关控添加事件 ,开关的值 改变时 触发 事件
    [_mySwitch addTarget:self action:@selector(swChage:) forControlEvents:UIControlEventValueChanged];
    
    
}

//将开关对象本身 作为参数 传入
- (void)swChage:(UISwitch *) sw{
    
    if (sw.on ==YES){
        NSLog(@"开关被打开！");
    }
    else{
        NSLog(@"开关被关闭！");
    }
}


#pragma  mark - NSTimer定时器

- (void)setTimeCreat{
    
    //创建 启动定时器按钮
    UIButton* btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame =CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"启动定时器" forState:UIControlStateNormal];
    //给按钮添加 事件
    [btn addTarget:self action:@selector(StartTime) forControlEvents:UIControlEventTouchUpInside];
    //添加按钮
    [self.view addSubview:btn];
    
    //创建 启动定时器按钮
    UIButton* btnStop =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnStop.frame =CGRectMake(100, 200, 80, 40);
    [btnStop setTitle:@"停止定时器" forState:UIControlStateNormal];
    //给按钮添加 事件
    [btnStop addTarget:self action:@selector(StopTime) forControlEvents:UIControlEventTouchUpInside];
    //添加按钮
    [self.view addSubview:btnStop];
    
    //添加视图
    UIView* view =[[UIView alloc] init];
    view.frame =CGRectMake(0, 0, 80, 80);
    view.backgroundColor =[UIColor orangeColor];
    
    [self.view addSubview:view];
    //设置标签值 ,通过父视图 对象以及 子视图的标签值 可以获得子视图对象
    view.tag =101;
    
}

//定时器事件
- (void)updateTimer:(NSTimer *)timer{
    //定时器本身作为参数
    NSLog(@"name= %@" ,timer.userInfo);
    
    //tag从100开始
    UIView* view =[self.view viewWithTag:101];
    view.frame =CGRectMake(view.frame.origin.x +1, view.frame.origin.y +1, 80, 80);
}

//启动定时器 按钮触发 ，多按几次可以达到 加速的效果
- (void)StartTime{
    
    //给定时器添加 触发事件 ，时间戳TimeInterval 以秒为单位
    _timer =[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer:) userInfo:@"小鑫" repeats:YES];
}

- (void)StopTime{
    
    if(_timer != nil){
        //停止定时器
        [_timer invalidate];
    }
}

#pragma  mark - UITapGestureRecognizer

- (void)UITapGestureRecognizerCreate{
    UIImage* image =[UIImage imageNamed:@"1.png"];
    //创建图像视图
    _imageView =[[UIImageView alloc] init];
    //将图像视图的 图像赋值
    _imageView.image =image;
    //视图大小
    _imageView.frame =CGRectMake(50, 80, 200, 300);
    //添加图像视图
    [self.view addSubview:_imageView];
    
    //开启交互事件响应开关
    //yes,可以使能交互事件
    //no,不能接受响应事件，默认值为no
    _imageView.userInteractionEnabled =YES;
    
    //创建一个点击手势对象
    //UITapGestureRecognizer手势类
    //创建一个识别手势 的对象
    UITapGestureRecognizer* tapGes =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneAct:)];
    //几次点击时触发事件 ,默认值为1
    tapGes.numberOfTapsRequired =1;
    //表示几个手指点击时 触发事件，默认值为1
    tapGes.numberOfTouchesRequired =1;
    //将点击事件添加到视图中，视图即 响应事件
    [_imageView addGestureRecognizer:tapGes];
    
    //创建双击手势事件
    UITapGestureRecognizer* tapGes2 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwoAct:)];
    //几次点击时触发事件 ,默认值为1
    tapGes2.numberOfTapsRequired =2;
    //表示几个手指点击时 触发事件，默认值为1
    tapGes2.numberOfTouchesRequired =1;
    //将点击事件添加到视图中，视图即 响应事件
    [_imageView addGestureRecognizer:tapGes2];
    //当单击操作遇到了 双击 操作时，单击失效
    [tapGes requireGestureRecognizerToFail:tapGes2];
}

#pragma  mark - 事件响应函数

- (void)tapOneAct:(UIGestureRecognizer *)tapOne{
    //获取手势监控的视图对象 tapOne.view
    UIImageView* imageView =(UIImageView *)tapOne.view;
    //开始动画过程
    [UIView beginAnimations:nil context:nil];
    //设置动画过程时间
    [UIView setAnimationDuration:0.5];
    
    imageView.frame =CGRectMake(0, 0, 320, 568);
    //结束动画过程
    [UIView commitAnimations];
}

- (void)tapTwoAct:(UIGestureRecognizer *)tapTwo{
    NSLog(@"双击了");
    //开始动画效果
    [UIView beginAnimations:nil context:nil];
    //动画时间
    [UIView setAnimationDuration:0.5];
    _imageView.frame =CGRectMake(50, 80, 200, 300);
    
    //结束动画
    [UIView commitAnimations];
}




//点击屏幕空白， 键盘就自动会隐藏
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [_textField resignFirstResponder];
//    [self.textview resignFirstResponder];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

@end
