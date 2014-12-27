//
//  HeapWithTestingTests.m
//  HeapWithTestingTests
//
//  Created by Morgan Chen on 12/27/14.
//  Copyright (c) 2014 Morgan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSMutableArray+HeapSort.h"

#define DANIEL = 0

static const NSUInteger kArrayLength = 100;

@interface HeapWithTestingTests : XCTestCase

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation HeapWithTestingTests

- (void)setUp {
    [super setUp];
    self.array = [NSMutableArray randomArrayWithLength:kArrayLength];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSortDidSucceed {
    NSMutableArray *referenceArray = [self.array mutableCopy];
    [referenceArray sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    [self.array sortWithHeapSort];
    
    BOOL result = [self.array isEqualToArray:referenceArray];
#ifdef DANIEL
    XCTAssert(result, @"HEAPSORT is ALL WRONG!!! OH NO...!!!!!");
#else
    XCTAssert(result, @"HeapSorted array must equal reference array");
#endif
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
