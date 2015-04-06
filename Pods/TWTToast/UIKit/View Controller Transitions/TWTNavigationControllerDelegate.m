//
//  TWTNavigationControllerDelegate.m
//  Toast
//
//  Created by Andrew Hershberger on 3/3/14.
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

#import "TWTNavigationControllerDelegate.h"

#import <objc/runtime.h>

#import "TWTTransitionController.h"


@implementation TWTNavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    switch (operation) {
        case UINavigationControllerOperationPush:
            return toVC.twt_pushAnimationController;
        case UINavigationControllerOperationPop:
            return fromVC.twt_popAnimationController;
        default:
            return nil;
    }
}


- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if (   [animationController respondsToSelector:@selector(isInteractive)]
        && [(id<TWTTransitionController>)animationController isInteractive]) {
        return (id<TWTTransitionController>)animationController;
    }

    return nil;
}

@end


#pragma mark

static const void *kPushAnimationControllerKey = &kPushAnimationControllerKey;
static const void *kPopAnimationControllerKey = &kPopAnimationControllerKey;


@implementation UIViewController (TWTNavigationControllerDelegate)

- (void)setTwt_pushAnimationController:(id<UIViewControllerAnimatedTransitioning>)twt_pushAnimationController
{
    objc_setAssociatedObject(self, kPushAnimationControllerKey, twt_pushAnimationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (id<UIViewControllerAnimatedTransitioning>)twt_pushAnimationController
{
    return objc_getAssociatedObject(self, kPushAnimationControllerKey);
}


- (void)setTwt_popAnimationController:(id<UIViewControllerAnimatedTransitioning>)twt_popAnimationController
{
    objc_setAssociatedObject(self, kPopAnimationControllerKey, twt_popAnimationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (id<UIViewControllerAnimatedTransitioning>)twt_popAnimationController
{
    return objc_getAssociatedObject(self, kPopAnimationControllerKey);
}

@end
