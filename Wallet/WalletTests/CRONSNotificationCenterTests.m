//
//  CRONSNotificationCenterTests.m
//  Wallet
//
//  Created by Jose Manuel Franco on 2/7/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CROFakeNotificationCenter.h"
#import "CROWallet.h"
#import <UIKit/UIKit.h>

@interface CRONSNotificationCenterTests : XCTestCase

@end

@implementation CRONSNotificationCenterTests


-(void) testThatSubscribesToMemoryWarning{
    CROFakeNotificationCenter  *fake=[CROFakeNotificationCenter new];
    CROWallet *wallet=[CROWallet new];
    
    [wallet subscribeToMemoryWarning:(NSNotificationCenter*)fake];
    
    NSDictionary *obs=[fake observers];
    id observer =[obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    XCTAssertEqualObjects(observer,wallet, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
