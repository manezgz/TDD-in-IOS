//
//  CROMoney.h
//  Wallet
//
//  Created by Jose Manuel Franco on 27/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CROMoney;
@class CROBroker;

@protocol CROMoney <NSObject>

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString*)currency;

-(id<CROMoney>) times:(NSInteger)multiplier;

-(id<CROMoney>) plus:(CROMoney*)other;

-(id<CROMoney>) reduceToCurrency:(NSString*) currency withBroker:(CROBroker*) broker;

@end

@interface CROMoney : NSObject<CROMoney>

@property(nonatomic,readonly,strong) NSNumber *amount;
@property(nonatomic,readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;





@end
