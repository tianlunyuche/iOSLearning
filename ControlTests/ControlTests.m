//
//  ControlTests.m
//  ControlTests
//
//  Created by xinying on 2016/12/3.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ControlTests : XCTestCase

@end

@implementation ControlTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self testIfUserStaticConfigPlistValid];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
    
-(void)testIfUserStaticConfigPlistValid{
    
    NSDictionary *configDict =[self dictFromPlist];
    XCTAssertNotNil(configDict ,"userForVistingVCID.plist 加载失败");
    [configDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        XCTAssert([obj isKindOfClass:[NSDictionary class]] ,@"plist文件结构出错，请修复");
        
        NSString *targetPageName =key;
        Class pageClass =NSClassFromString(targetPageName);
        id pageInstance =[[pageClass alloc] init];
        
        NSDictionary *pageDic =(NSDictionary *)obj;
       //页面配置信息
        NSDictionary *pageEventIDDict = pageDic[@"PageEventIDs"];
        
        //交互配置信息
        NSDictionary *controlEventIDDict = pageDic[@"ControlEventIDs"];
        
        XCTAssert(pageEventIDDict ,@"plist文件未包含PageID字段或者该字段值为空");
        XCTAssert(controlEventIDDict ,@"plist文件未包含EventIDs字段或者该字段值为空");
        
        [pageEventIDDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            XCTAssert([obj isKindOfClass:[NSString class]], @"plist文件结构可能已经改变，请确认");
            XCTAssertNotNil(obj, @"EVENT_ID为空，请确认");
        }];
        
        [controlEventIDDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            XCTAssert([obj isKindOfClass:[NSString class]], @"plist文件结构可能已经改变，请确认");
            
            NSString *actionName =key;
            SEL actionSel =NSSelectorFromString(actionName);
            XCTAssert([pageInstance respondsToSelector:actionSel], @"代码与plist文件函数不匹配，请确认：-[%@ %@]",targetPageName ,actionName);
        }];
        
    }];
}
    
    
-(NSDictionary *)dictFromPlist{
    
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"userForVistingVCID" ofType:@"plist"];
    NSDictionary *dic =[NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return dic;
}

@end
