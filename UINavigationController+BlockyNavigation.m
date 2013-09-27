//
//  UINavigationController+BlockyNavigationController.m
//  Navigation
//
//  Created by Lewis Daly on 27/09/13.
//  Copyright (c) 2013 Lewis Daly. All rights reserved.
//

#import "UINavigationController+BlockyNavigation.h"

@implementation UINavigationController (BlockyNavigation)

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(dispatch_block_t)completionBlock
{
    self.delegate = self;
    if ([viewController conformsToProtocol:@protocol(BlockyNavigation)])
    {
        UIViewController <BlockyNavigation> *vc = (UIViewController <BlockyNavigation> *) viewController;
        [vc setTheCompletionBlock:completionBlock];
    }
    
    [self pushViewController:viewController animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //Call the block here
    if ([viewController conformsToProtocol:@protocol(BlockyNavigation)])
    {
        UIViewController <BlockyNavigation> *vc = (UIViewController <BlockyNavigation> *) viewController;
        [vc runCompletionBlock];
    }
}

@end
