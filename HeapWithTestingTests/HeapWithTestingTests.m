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

- (void)testHeapifyDidSucceed {
    NSLog(@"testHeapifyDidSucceed assumes a max heap. If you use a min heap, you must rewrite this test.");
    
    // heapify
    [self.array heapify];
    
    BOOL heapIsValid = YES;
    
    // check that max-heap status is maintained
    for (NSInteger i = 0; i < self.array.count; i++) {
        
        // assign pointers
        NSNumber *node = self.array[i];
        NSUInteger leftChildIndex = 2*i + 1;
        NSUInteger rightChildIndex = 2*i + 2;
        NSNumber *leftChild;
        NSNumber *rightChild;
        if (leftChildIndex < self.array.count) leftChild = self.array[leftChildIndex];
        if (rightChildIndex < self.array.count) rightChild = self.array[rightChildIndex];
        
        // check that max heap is maintained
        if (leftChild && [leftChild compare:node] == NSOrderedDescending) {
            heapIsValid = NO;
            break;
        }
    }
    
    XCTAssert(heapIsValid, @"Heapify does not work. Send help");
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
