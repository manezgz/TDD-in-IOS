//
//  CROBrokerTests.m
//  Wallet
//
//  Created by Jose Manuel Franco on 28/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CROBroker.h"
#import "CROMoney.h"

@interface CROBrokerTests : XCTestCase
@property(nonatomic,strong) CROBroker *emptyBroker;
@property(nonatomic,strong) CROMoney  *oneDollar;
@end

@implementation CROBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker=[CROBroker new];
    self.oneDollar=[CROMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker=nil;
    self.oneDollar=nil;
}

- (void)testSimpleReduction {
    CROMoney *sum=[[CROMoney dollarWithAmount:5]plus:[CROMoney dollarWithAmount:5]];
    
    CROMoney *reduced=[self.emptyBroker reduce:sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum,reduced, @"Conversion to same currency should be a NOP");
}

//$10 == €5 con un ratio 2:1
-(void) testReduction{
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    CROMoney *dollars=[CROMoney dollarWithAmount:10];
    CROMoney *euros=[CROMoney euroWithAmount:5];
    
    CROMoney *converted=[self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    XCTAssertEqualObjects(converted, euros,@"$10 == €5 con un ratio 2:1");
    
}

-(void) testThatNotRateException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"],
                    @"No rates should cause Exception");
}

-(void) testThatNillConversionDoesNotChangeMoney{
    XCTAssertEqualObjects(self.oneDollar,
                          [self.emptyBroker reduce:self.oneDollar
                                        toCurrency:@"USD"],
                          @"A nil conversion should have no effect");
}

@end
