//
//  WalletTableTableViewController.h
//  Wallet
//
//  Created by Jose Manuel Franco on 30/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CROWallet.h"
@class CROWallet;

@interface WalletTableTableViewController : UITableViewController


-(id) initWithModel:(CROWallet*)model;

@end
