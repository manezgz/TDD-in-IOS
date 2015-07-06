//
//  CROFakeNotificationCenter.h
//  Wallet
//
//  Created by Jose Manuel Franco on 2/7/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CROFakeNotificationCenter : NSObject

@property (nonatomic,strong) NSMutableDictionary *observers;

- (void)addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)notificationName
             object:(id)anObject;



@end
