//
//  CROMoney.m
//  Wallet
//
//  Created by Jose Manuel Franco on 27/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import "CROMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "CROBroker.h"

@interface CROMoney ()
@property (nonatomic,strong) NSNumber* amount;
@end

@implementation CROMoney

+(id) euroWithAmount:(NSInteger) amount{
    return [[CROMoney alloc]initWithAmount:amount
                                  currency:@"EUR"];
}
+(id) dollarWithAmount:(NSInteger) amount{
    return [[CROMoney alloc]initWithAmount:amount
                                  currency:@"USD"];
}

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString*)currency{
    
    if(self==[super init]){
        _amount=@(amount);
        _currency=currency;
    }
    return self;

}

-(id<CROMoney>) times:(NSInteger)multiplier{
    
        CROMoney *newMoney=[[CROMoney alloc] initWithAmount:[self.amount integerValue]* multiplier  currency:self.currency];
        return newMoney;
}

-(id<CROMoney>) plus:(CROMoney*)other{
    NSInteger totalAmount=[self.amount integerValue]+[other.amount integerValue];
    
    CROMoney *total=[[CROMoney alloc]initWithAmount:totalAmount
                                           currency:self.currency];
    
    return total;
}

-(id<CROMoney>) reduceToCurrency:(NSString*) currency withBroker:(CROBroker*) broker{
    CROMoney *result;
    double rate=[[broker.rates
                  objectForKey:[broker keyFromCurrency:self.currency
                                          toCurrency:currency]] doubleValue];
    if([self.currency isEqual:currency]){
        result=self;
    }else if(rate==0){
        //No hay tasa de conversión.
        //Lanzamos Excepcion
        [NSException raise:@"No Conversion Rate Exception"
                    format:@"Must have a conversion from %@ to %@",
         self.currency,currency];
    }else{
        double rate=[[broker.rates objectForKey:[broker keyFromCurrency:self.currency
                                                         toCurrency:currency]] doubleValue];
        
        NSInteger newAmount=[self.amount integerValue]*rate;
        result=[[CROMoney alloc]initWithAmount:newAmount
                                      currency:currency];
        
    }
    
    return result;
}

#pragma mark -Overwritten
-(NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class],self.currency,self.amount];
}

-(BOOL) isEqual:(id)object{
    if([self.currency isEqual:[object currency]]){
        return [self amount] ==[object amount];
    }else{
        return NO;
    }
}

-(NSUInteger) hash{
    
    return [self.amount integerValue];
}


@end
