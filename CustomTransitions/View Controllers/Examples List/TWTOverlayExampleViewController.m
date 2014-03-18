//
//  TWTOverlayExampleViewController.m
//  CustomTransitions
//
//  Created by Andrew Hershberger on 3/16/14.
//  Copyright (c) 2014 Two Toasters, LLC. All rights reserved.
//

#import "TWTOverlayExampleViewController.h"


@implementation TWTOverlayExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.clipsToBounds = NO;

    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOpacity = 0.5;
    self.view.layer.shadowRadius = 10.0;
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds];
    self.view.layer.shadowPath = shadowPath.CGPath;
}

@end
