//
//  CROWalletTests.m
//  Wallet
//
//  Created by Jose Manuel Franco on 28/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CROMoney.h"
#import "CROBroker.h"
#import "CROWallet.h"

@interface CROWalletTests : XCTestCase

@end

@implementation CROWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
- (void)testAdditionWithReduction {
    
    CROBroker *broker=[CROBroker new];
    [broker addRate:2
       fromCurrency:@"EUR"
         toCurrency:@"USD"];
    
    CROWallet *wallet=[[CROWallet alloc]initWithAmount:40 currency:@"EUR"];
    [wallet plus:[CROMoney dollarWithAmount:20]];
    CROMoney *reduced=[broker reduce:wallet
                          toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [CROMoney dollarWithAmount:100],@"€40 + $20 =$100 2:1");
}

@end
