//
//  CROControllerTests.m
//  Wallet
//
//  Created by Jose Manuel Franco on 30/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CROSimpleViewController.h"
#import "WalletTableTableViewController.h"
#import "CROWallet.h"

@interface CROControllerTests : XCTestCase
@property (nonatomic,strong) CROSimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@property (nonatomic,strong) WalletTableTableViewController *walletVC;
@property (nonatomic,strong) CROWallet *wallet;
@end

@implementation CROControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.simpleVC=[[CROSimpleViewController alloc]initWithNibName:nil
                                                            bundle:nil];
    self.button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola"
                 forState:UIControlStateNormal];
    self.label=[[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel=self.label;
    
    self.wallet=[[CROWallet alloc]initWithAmount:1
                                        currency:@"USD"];
    [self.wallet plus:[CROMoney euroWithAmount:1]];
    self.walletVC=[[WalletTableTableViewController alloc]initWithModel:self.wallet];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.simpleVC=nil;
    self.button=nil;
    self.label=nil;
}

- (void)testThatTextOnLableIsEqualToTextOnButton {
    
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    //Comprobamos que etiqueta y boton tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text,
                          self.label.text,@"Button and label should have the same test");
    
}

-(void) testThatTableHasOneSection{
    NSUInteger sections=[self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections,1, @"There can only be one");
}

-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    XCTAssertEqual(self.wallet.count+1, [self.walletVC tableView:nil numberOfRowsInSection:0],@"Number of celss is the number of moneys plus 1 (the total)");
}

@end
