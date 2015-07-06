//
//  CROWallet.m
//  Wallet
//
//  Created by Jose Manuel Franco on 28/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import "CROWallet.h"
#import <UIKit/UIKit.h>

@interface CROWallet()
@property (nonatomic,strong) NSMutableArray *moneys;
@end

@implementation CROWallet

-(NSUInteger) count{
    return [self.moneys count];
}


-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if(self =[super init]){
        CROMoney *money=[[CROMoney alloc]initWithAmount:amount
                                               currency:currency];
        _moneys=[NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}


-(id<CROMoney>)plus:(CROMoney *)other{
    [self.moneys addObject:other];
    return self;
}

-(id<CROMoney>) times:(NSInteger)multiplier{
    NSMutableArray *newMoneys=[NSMutableArray arrayWithCapacity:self.moneys.count];
    for(CROMoney *each in self.moneys){
        CROMoney *newMoney=[each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys=newMoneys;
    return self;
}

-(id<CROMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(CROBroker*) broker{
    
    CROMoney *result=[[CROMoney alloc]initWithAmount:0 currency:currency];
    
    for(CROMoney *each in self.moneys){
        result=[result plus:[each reduceToCurrency:currency
                           withBroker:broker]];
    }
    return result;
}

-(void) subscribeToMemoryWarning:(NSNotificationCenter*)nc{
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

-(void) dumpToDisk:(NSNotification *)notification{
    
}

@end
