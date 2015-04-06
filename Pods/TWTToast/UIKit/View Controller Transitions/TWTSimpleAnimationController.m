//
//  TWTSimpleAnimationController.m
//  Toast
//
//  Created by Andrew Hershberger on 3/4/14.
//  Copyright (c) 2014 Two Toasters, LLC.
//  A prior version of this code was written for Normal Ears, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "TWTSimpleAnimationController.h"


@implementation TWTSimpleAnimationController

- (instancetype)init
{
    return [self initWithDuration:0.5 options:0];
}


- (instancetype)initWithDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options
{
    self = [super init];
    if (self) {
        _duration = duration;
        _options = options;
    }

    return self;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [toViewController.view layoutIfNeeded];

    BOOL optionsContainShowHideTransitionViews = (self.options & UIViewAnimationOptionShowHideTransitionViews) != 0;
    if (!optionsContainShowHideTransitionViews) {
        [[transitionContext containerView] addSubview:toViewController.view];
    }

    [UIView transitionFromView:fromViewController.view
                        toView:toViewController.view
                      duration:self.duration
                       options:self.options | UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                        if (!optionsContainShowHideTransitionViews) {
                            [fromViewController.view removeFromSuperview];
                        }

                        [transitionContext completeTransition:YES];
                    }];
}

@end
