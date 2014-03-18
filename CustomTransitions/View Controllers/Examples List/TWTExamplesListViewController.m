//
//  TWTExamplesListViewController.m
//  CustomTransitions
//
//  Created by Andrew Hershberger on 3/3/14.
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

#import "TWTExamplesListViewController.h"

#import <TWTToast/TWTSimpleAnimationController.h>

#import "TWTChangingTabsExampleViewController.h"
#import "TWTDismissAnimationController.h"
#import "TWTExampleConfiguration.h"
#import "TWTExampleViewController.h"
#import "TWTOverlayExampleViewController.h"
#import "TWTPresentAnimationController.h"
#import "TWTPushExampleViewController.h"


static NSString *const kCellIdentifier = @"ExampleCell";


#pragma mark

@interface TWTExamplesListViewController () <TWTExampleViewControllerDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic, copy) NSArray *cellConfigurations;
@end


@implementation TWTExamplesListViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.title = NSLocalizedString(@"examplesList.title", nil);

        _cellConfigurations = @[ [[TWTExampleConfiguration alloc] initWithName:NSLocalizedString(@"example.push.name", nil) tapHandler:^{ [self presentPushExample]; }],
                                 [[TWTExampleConfiguration alloc] initWithName:NSLocalizedString(@"example.tabs.name", nil) tapHandler:^{ [self presentTabsExample]; }],
                                 [[TWTExampleConfiguration alloc] initWithName:NSLocalizedString(@"example.present.name", nil) tapHandler:^{ [self presentPresentExample]; }] ];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellConfigurations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTExampleConfiguration *configuration = self.cellConfigurations[indexPath.row];
    cell.textLabel.text = configuration.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTExampleConfiguration *configuration = self.cellConfigurations[indexPath.row];
    configuration.tapHandler();
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - TWTExampleViewControllerDelegate

- (void)exampleViewControllerDidFinish:(TWTExampleViewController *)exampleViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Push Pop Example

- (void)presentPushExample
{
    TWTPushExampleViewController *viewController = [[TWTPushExampleViewController alloc] init];
    viewController.delegate = self;

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.delegate = self;

    [self presentViewController:navigationController animated:YES completion:nil];
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    TWTSimpleAnimationController *animationController = [[TWTSimpleAnimationController alloc] init];
    animationController.duration = 0.5;
    animationController.options = (  operation == UINavigationControllerOperationPush
                                   ? UIViewAnimationOptionTransitionFlipFromRight
                                   : UIViewAnimationOptionTransitionFlipFromLeft);
    return animationController;
}


#pragma mark - Changing Tabs Example

- (void)presentTabsExample
{
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];

    for (NSUInteger i=0; i<3; i++) {
        TWTChangingTabsExampleViewController *viewController = [[TWTChangingTabsExampleViewController alloc] init];
        viewController.delegate = self;
        viewController.index = i;
        [viewControllers addObject:viewController];
    }

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:viewControllers animated:NO];
    tabBarController.delegate = self;

    [self presentViewController:tabBarController animated:YES completion:nil];
}


- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
           animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                             toViewController:(UIViewController *)toVC
{
    TWTSimpleAnimationController *animationController = [[TWTSimpleAnimationController alloc] init];
    animationController.duration = 0.5;
    animationController.options = UIViewAnimationOptionTransitionCrossDissolve;
    return animationController;
}


#pragma mark - Present Dismiss Example

- (void)presentPresentExample
{
    TWTOverlayExampleViewController *viewController = [[TWTOverlayExampleViewController alloc] init];
    viewController.delegate = self;
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    viewController.transitioningDelegate = self;

    [self presentViewController:viewController animated:YES completion:nil];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [[TWTPresentAnimationController alloc] init];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[TWTDismissAnimationController alloc] init];
}

@end
