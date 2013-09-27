BlockyNavigation
================

A simple UINavigationController Extension for getting completion blocks on pushViewController on your Navigation Controllers


Using It
========

- '#import "UINavigationController+BlockyNavigation.h" wherever you need.
- Conform your UIViewController subclasses to the '<BlockyNavigation>' Protocol
- Implement the following methods:


      #pragma mark - Blocky Navigation
    - (void) setTheCompletionBlock:(dispatch_block_t)completionBlock
    {
       self.completionBlock = completionBlock;
    }

    - (void) runCompletionBlock
    {
      _completionBlock();
    }
    
- And replace your typical pushViewController:Animated: with:

    __block LDSecondViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LDSecondViewController"];
    
    [self.navigationController pushViewController:vc animated:YES completion:^{
    
        vc.label.text = @"IT WORKS!";
    
    }];
    
    
I hope someone can find this useful! Feel free to fix any problems you see with my Code!
