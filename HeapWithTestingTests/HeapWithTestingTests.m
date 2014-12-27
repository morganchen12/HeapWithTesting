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

static const NSUInteger kArrayLength = 100000;

@interface HeapWithTestingTests : XCTestCase

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation HeapWithTestingTests

- (void)setUp {
    [super setUp];
    self.array = [NSMutableArray randomArrayWithLength:kArrayLength];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSortDidSucceed {
    NSMutableArray *referenceArray = [self.array mutableCopy];
    [referenceArray sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    
    [self measureBlock:^{
        [self.array sortWithHeapSort];
    }];
    
    BOOL result = [self.array isEqualToArray:referenceArray];

    XCTAssert(result, @"HEAPSORT is ALL WRONG!!! OH NO...!!!!!");
}

@end
