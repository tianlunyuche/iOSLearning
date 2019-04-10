//
//  ZXASIHttpVC.m
//  Control
//
//  Created by 赵庄鑫 on 2019/4/10.
//  Copyright © 2019 paohon. All rights reserved.
//

#import "ZXASIHttpVC.h"
#import "ASIHTTPRequest-umbrella.h"

@interface ZXASIHttpVC ()
//<ASICacheDelegate>
@property (nonatomic, strong) NSOperationQueue *queue;
@end
//ASIHttpRequest发送数据的内容，其中包括设定request头，使用ASIFormDataRequest POST表单，PUT请求、自定义POST请求等等内容。
@implementation ZXASIHttpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self synchronousRequest];
}

- (void)synchronousRequest {
//    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://mapi.ekwing.com/comm/index/getbanner?v=1.0&biz=PARENT_IOS_BANNER&uid=20212161"] usingCache:self andCachePolicy:ASIUseDefaultCachePolicy];
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://mapi.ekwing.com/comm/index/getbanner?v=1.0&biz=PARENT_IOS_BANNER&uid=20212161"]];
    [req startSynchronous];
    req.validatesSecureCertificate = YES;   //支持https
    
    if (!req.error) {
        NSString *response = req.responseString;
        ZXLog(@"%@",response);
    } else {
        ZXLog(@"出错");
    }
}

- (void)asynchronousReq {
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://mapi.ekwing.com/comm/index/getbanner?v=1.0&biz=PARENT_IOS_BANNER&uid=20212161"]];
    req.delegate = self;
    [req startAsynchronous];
}

- (void)blockReq {
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://mapi.ekwing.com/comm/index/getbanner?v=1.0&biz=PARENT_IOS_BANNER&uid=20212161"]];
    @weakify(req)
    [req setCompletionBlock:^{
        @strongify(req)
        NSString *reqstr = req.responseString;
        ZXLog(@"%@",reqstr);
    }];
    [req setFailedBlock:^{
        @strongify(req)
        NSError *error = req.error;
        ZXLog(@"%@",error);
    }];
    [req startAsynchronous];
}

//使用队列实现并发请求
- (void)operationReq {
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://mapi.ekwing.com/comm/index/getbanner?v=1.0&biz=PARENT_IOS_BANNER&uid=20212161"]];
    [request addRequestHeader:@"Referer" value:@"https://mapi.ekwing.com/comm/index/getbanner?v=1.0&biz=PARENT_IOS_BANNER&uid=20212161"];
    request.delegate = self;
    request.didFinishSelector = @selector(requestDone:);
    request.didFailSelector = @selector(requestError:);
    
    [self.queue addOperation:request];
}

//分表单请求
- (void)formReq {
    //
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://mapi.ekwing.com/comm/index/getbanner?v=1.0&biz=PARENT_IOS_BANNER&uid=20212161"]];

    [request setPostValue:@"ben" forKey:@"fname"];
    [request setFile:@"/Volumes/MacData/MacData/projects/paohon-master/README.md" withFileName:@"myReadme.md" andContentType:@"" forKey:@"readme"];
    [request startAsynchronous];
}

- (void)requestDone:(ASIHTTPRequest *)req {
    ZXLog(@"%@",req.responseString);
}

- (void)requestError:(ASIHTTPRequest *)req {
    ZXLog(@"%@",req.error);
}

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 4;
    }
    return _queue;
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSString *responseStr = request.responseString;
    int state = request.responseStatusCode;
    
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = [request error];
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
