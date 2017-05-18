//
//  TPUnionPayViewController.m
//  TPUnionPay
//
//  Created by kingdomrain on 02/15/2017.
//  Copyright (c) 2017 kingdomrain. All rights reserved.
//

#import "TPUnionPayViewController.h"
#import <TPUnionPay/TPUnionPay.h>


@interface TPUnionPayViewController ()

@end

@implementation TPUnionPayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    TPUnionPay *unionPay = [[TPUnionPay alloc] init];
    [unionPay pay];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
