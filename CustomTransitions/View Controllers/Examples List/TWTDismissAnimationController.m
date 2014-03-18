//
//  TWTDismissAnimationController.m
//  CustomTransitions
//
//  Created by Andrew Hershberger on 3/15/14.
//  Copyright (c) 2014 Two Toasters, LLC.
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

#import "TWTDismissAnimationController.h"


@implementation TWTDismissAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.2;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    NSTimeInterval duration = [self transitionDuration:transitionContext];

    [UIView animateWithDuration:3.0 * duration / 4.0
                          delay:duration / 4.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         fromViewController.view.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [fromViewController.view removeFromSuperview];
                         [transitionContext completeTransition:YES];
                     }];

    [UIView animateWithDuration:2.0 * duration
                          delay:0.0
         usingSpringWithDamping:1.0
          initialSpringVelocity:-15.0
                        options:0
                     animations:^{
                         fromViewController.view.transform = CGAffineTransformMakeScale(0.3, 0.3);
                     }
                     completion:nil];
}

@end
