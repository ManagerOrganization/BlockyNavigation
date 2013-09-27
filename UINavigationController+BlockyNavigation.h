//
//  UINavigationController+BlockyNavigationController.h
//  Navigation
//
//  Created by Lewis Daly on 27/09/13.
//  Copyright (c) 2013 Lewis Daly. All rights reserved.
//

#import <UIKit/UIKit.h>

//Conform Your VC's to this protocol, and call away!
@protocol BlockyNavigation <NSObject>

- (void) setTheCompletionBlock:(dispatch_block_t)completionBlock;
- (void) runCompletionBlock;

@end


@interface UINavigationController (BlockyNavigation) <UINavigationControllerDelegate>

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(dispatch_block_t)completionBlock;

@end

