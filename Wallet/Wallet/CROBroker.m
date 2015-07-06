//
//  CROBroker.m
//  Wallet
//
//  Created by Jose Manuel Franco on 28/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import "CROBroker.h"
#import "CROMoney.h"

@implementation CROBroker

-(id)init{
    if(self =[super init]){
        _rates=[@{}mutableCopy];
    }
    return self;
}

-(CROMoney *)reduce:(id<CROMoney>) money
           toCurrency:(NSString *)currency{
    
    //Double dispatch
    return [money reduceToCurrency:currency
                        withBroker:self];
    
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    
    NSNumber *invRate=@(1.0/rate);
    [self.rates setObject:invRate
                   forKey:[self keyFromCurrency:toCurrency
                                     toCurrency:fromCurrency]];
    
}

-(NSString *) keyFromCurrency:(NSString*)fromCurrency
                   toCurrency:(NSString*)toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}

@end
