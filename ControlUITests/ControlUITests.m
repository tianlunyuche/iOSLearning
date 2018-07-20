//
//  ControlUITests.m
//  ControlUITests
//
//  Created by xinying on 2017/1/17.
//  Copyright © 2017年 paohon. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ControlUITests : XCTestCase

@end

@implementation ControlUITests
//每次测试前调用，可以在测试之前创建在test case方法中需要用到的一些对象等
- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}
//每次测试结束时调用tearDown方法
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    //设置变量和设置预期值
    NSUInteger a = 10;NSUInteger b = 15;
    NSUInteger expected = 25;
    //执行方法得到实际值
    NSUInteger actual = [self add:a b:b];
    //断言判定实际值和预期是否符合 ,对方法测试
    XCTAssertEqual(expected, actual,@"add方法错误！");
}

- (void)testAsynExample {
    XCTestExpectation *exp = [self expectationWithDescription:@"这里可以是操作出错的原因描述。。。"];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        //模拟这个异步操作需要2秒后才能获取结果，比如一个异步网络请求
        sleep(2);
        //模拟获取的异步操作后，获取结果，判断异步方法的结果是否正确
        XCTAssertEqual(@"a", @"a");
        //如果断言没问题，就调用fulfill宣布测试满足
        [exp fulfill];
    }];
    
    //设置延迟多少秒后，如果没有满足测试条件就报错
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(NSUInteger)add:(NSUInteger)a b:(NSUInteger)b{
    return a+b;
}
//用于测试一组方法的执行时间，通过设置baseline（基准）和stddev（标准偏差）来判断方法是否能通过性能测试。
- (void)testPerformanceExample {
    //性能测试方法，通过测试block中方法执行的时间，比对设定的标准值和偏差觉得是否可以通过测试
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        //你的性能测试的代码放在这里
    }];
}

@end
