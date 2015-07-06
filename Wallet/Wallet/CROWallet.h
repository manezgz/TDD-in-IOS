//
//  CROWallet.h
//  Wallet
//
//  Created by Jose Manuel Franco on 28/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CROMoney.h"

@interface CROWallet : NSObject<CROMoney>

@property (nonatomic,readonly) NSUInteger count;

-(void) subscribeToMemoryWarning:(NSNotificationCenter*)nc;

@end
