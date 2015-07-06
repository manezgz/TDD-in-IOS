//
//  CROSimpleViewController.m
//  Wallet
//
//  Created by Jose Manuel Franco on 30/6/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import "CROSimpleViewController.h"

@implementation CROSimpleViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self =[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)displayText:(id)sender {
    UIButton *btn=sender;
    NSLog(@"%@",btn.titleLabel.text);
    self.displayLabel.text=btn.titleLabel.text;
}


@end
