//
//  CROFakeNotificationCenter.m
//  Wallet
//
//  Created by Jose Manuel Franco on 2/7/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import "CROFakeNotificationCenter.h"

@implementation CROFakeNotificationCenter

-(id)init{
    if(self =[super init]){
        _observers=[NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)notificationName
             object:(id)anObject{
    
    [self.observers setObject:observer
                       forKey:notificationName];
}



@end
