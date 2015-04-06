//
//  TWTNavigationControllerDelegate.h
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

#import <Foundation/Foundation.h>


/*!
 TWTNavigationControllerDelegate is a navigation controller delegate that implements
 -navigationController:animationControllerForOperation:fromViewController:toViewController:. 
 Its implementation returns the to view-controller’s push animation controller on pushes and
 the from view-controller’s pop animation controller on pops. See UIViewController 
 (TWTNavigationControllerDelegate) for more information.
 
 This class can be used as the base class for other navigation controller delegates, should
 you wish to implement additional methods in the UINavigationControllerDelegate protocol.
 */
@interface TWTNavigationControllerDelegate : NSObject <UINavigationControllerDelegate>
@end


/*!
 The TWTNavigationControllerDelegate category on UIViewController adds the ability to store a 
 view controller’s push and pop animation controllers as properties of the view controller itself.
 */
@interface UIViewController (TWTNavigationControllerDelegate)

/*! The animation controller to use when pushing to the receiver. */
@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> twt_pushAnimationController;

/*! The animation controller to use when popping from the receiver. */
@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> twt_popAnimationController;

@end
