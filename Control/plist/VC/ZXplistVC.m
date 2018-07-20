//
//  ZXplistVC.m
//  Control
//
//  Created by xinying on 2016/7/16.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXplistVC.h"

@interface ZXplistVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray  *listData;
@property(nonatomic,copy) NSString  *path;
@end

@implementation ZXplistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.ZXTableV =[[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.ZXTableV];
    self.ZXTableV.delegate =self;
    self.ZXTableV.dataSource =self;
    //路径
    self.path =[[NSBundle mainBundle] pathForResource:@"Data2" ofType:@"plist"];
    self.path =[[NSBundle mainBundle] pathForResource:@"List" ofType:@"plist"];
    NSArray *array =[NSArray arrayWithContentsOfFile:self.path];
    self.listData =[NSMutableArray arrayWithArray:array];
    
    ZXLog(@"%@",self.listData);
    NSString *pram =@"http://www.baidu.com/";
    if (pram.length ==0) {
        ZXLog(@"");
        return;
    }
    
    NSURLCache *urlCache =[NSURLCache sharedURLCache];
    urlCache.memoryCapacity =1*1024*1024; //1M
    //
    NSURL *url =[NSURL URLWithString:pram];
    //
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0f];
    //
    NSCachedURLResponse *response =[urlCache cachedResponseForRequest:request];
    
    //
    if (response !=nil) {
        request.cachePolicy =NSURLRequestReturnCacheDataDontLoad;
    }
    
    NSURLConnection *newConn =[[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}

-(void)addcontent{
    [self.listData addObject:@"web"];
    [self.listData writeToFile:self.path atomically:YES];
}

-(void)remove{
    [self.listData removeObjectAtIndex:2];
    [self.listData writeToFile:self.path atomically:YES];
    [self.ZXTableV reloadData];
}

-(void)correct{
    [self.listData replaceObjectAtIndex:2 withObject:@"database"];
    [self.listData writeToFile:self.path atomically:YES];
    
}

#pragma mark - Table Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZXLog(@"self.listData.count%lu",(unsigned long)self.listData.count);
    return self.listData.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    static NSString *simID =@"SimpleTableIdentifier";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:simID];
    if (cell ==nil) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simID];
    }
    cell.textLabel.text =[self.listData objectAtIndex:indexPath.row];
    ZXLog(@"cell.textLabel.text %@",cell.textLabel.text);
    return cell;
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
