//
//  CROMoneyTest.m
//  Wallet
//
//  Created by Jose Manuel Franco on 28/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import "CROMoney.h"
#import <XCTest/XCTest.h>

@interface CROMoneyTest : XCTestCase

@end
@implementation CROMoneyTest

-(void) testCurrencies{
    
    XCTAssertEqualObjects(@"EUR",[[CROMoney euroWithAmount:1] currency],@"The currecny of euros should be EUR");
    
    
    XCTAssertEqualObjects(@"USD",[[CROMoney dollarWithAmount:1] currency],@"The currecny of euros should be USD");
}

-(void) testMultiplicacion{
    CROMoney *euro=[CROMoney euroWithAmount:5];
    CROMoney *ten =[CROMoney euroWithAmount:10];
    CROMoney *total=[euro times:2];
    
    XCTAssertEqualObjects(total, ten,@"5€ *2 should be 10");
}

-(void) testEquality{
    CROMoney *five=[CROMoney euroWithAmount:5];
    CROMoney *ten=[CROMoney euroWithAmount:10];
    CROMoney *total=[five times:2];
    XCTAssertEqualObjects(ten,total, @"Equivalent objects should be equal");
}

-(void) testHash{
    CROMoney *a =[CROMoney euroWithAmount:2];
    CROMoney *b =[CROMoney euroWithAmount:2];
    XCTAssertEqual([a hash], [b hash],@"Equal objects must have the same hash");
}


-(void) testAmountStorage{
    CROMoney *euro=[CROMoney euroWithAmount:2];
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue],@"The value retrieve shoud be the same as the stored");
}

-(void) testDifferentCurrencies{
    
    CROMoney *euro=[CROMoney euroWithAmount:1];
    CROMoney *dollar=[CROMoney dollarWithAmount:1];
    XCTAssertNotEqualObjects(euro, dollar,@"Different currencies should not be equal");
}

-(void) testMultiplicacionDollar{
    CROMoney *five=[CROMoney dollarWithAmount:5];
    CROMoney *total=[five times:2];
    CROMoney *ten=[CROMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten,total, @"$5 *2 =$10");
}

-(void) testEqualityDollar{
    CROMoney *five=[CROMoney dollarWithAmount:5];
    CROMoney *ten=[CROMoney dollarWithAmount:10];
    CROMoney *total=[five times:2];
    XCTAssertEqualObjects(ten,total, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects should not be equal");
}

-(void) testHashDollar{
    CROMoney *a =[CROMoney dollarWithAmount:2];
    CROMoney *b =[CROMoney dollarWithAmount:2];
    XCTAssertEqual([a hash], [b hash],@"Equal objects must have the same hash");
}

-(void) testSimpleAddition{
    XCTAssertEqualObjects([[CROMoney dollarWithAmount:5]plus:
                              [CROMoney dollarWithAmount:5]],
                              [CROMoney dollarWithAmount:10],
                              @"$5 +$5=$10");
}

-(void) testHashAmount{
    CROMoney *one=[CROMoney dollarWithAmount:1];
    XCTAssertEqual([one hash],1,@"The hash should be the same as the amount");
}

-(void) testDescription{
    CROMoney *one=[CROMoney dollarWithAmount:1];
    NSString *desc=@"<CROMoney: USD 1>";
    
    XCTAssertEqualObjects(desc, [one description],@"Description must match template");
}




@end
