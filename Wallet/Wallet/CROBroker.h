//
//  CROBroker.h
//  Wallet
//
//  Created by Jose Manuel Franco on 30/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CROMoney.h"

@interface CROBroker : NSObject

@property(nonatomic,strong)NSMutableDictionary *rates;

-(CROMoney*) reduce:(id<CROMoney>)money
            toCurrency:(NSString *)currency;


-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency;

-(NSString *) keyFromCurrency:(NSString*)fromCurrency
                   toCurrency:(NSString*)toCurrency;
@end