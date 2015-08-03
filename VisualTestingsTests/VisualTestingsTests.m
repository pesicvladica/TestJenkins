//
//  VisualTestingsTests.m
//  VisualTestingsTests
//
//  Created by Vladica Pesic on 28/07/2015.
//  Copyright (c) 2015 Vladica Pesic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface VisualTestingsTests : XCTestCase

@end

@implementation VisualTestingsTests

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
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
//	XCTestExpectation
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
