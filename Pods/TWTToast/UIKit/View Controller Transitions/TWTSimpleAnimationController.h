//
//  TWTSimpleAnimationController.h
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

#import <UIKit/UIKit.h>

/*!
 TWTSimpleAnimationController provides a basic implementation of the UIViewControllerAnimatedTransitioning
 protocol. It allows for customizing transitions between view controllers using UIViewAnimationOptions. This 
 enables easily transitioning between view controllers using flips, page curls, and cross disolves. 
 */
@interface TWTSimpleAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

/*! 
 @abstract Returns an initialized animation controller instance with the specified duration and animation options.
 @discussion This is the class’s designated initializer.
 @param duration The duration of the animated transition.
 @param options The animation options used during the transition. This can be used to customize what animation 
     is used.
 @result An initialized simple animation controller with the specified duration and options.
 */
- (instancetype)initWithDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options;

/*! The duration of the transition. 0.5 by default. */
@property (nonatomic) NSTimeInterval duration;

/*! The options for the transition animation. Use this to change the type of animation. 0 by default. */
@property (nonatomic) UIViewAnimationOptions options;

@end
