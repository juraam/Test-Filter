//
//  WelcomeRouter.m
//	testfilters
//

#import "WelcomeRouter.h"
#import "WelcomePresenter.h"

@interface WelcomeRouter ()

@end

@implementation WelcomeRouter

- (void)presentModuleFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [window setRootViewController:navigationController];
    [window makeKeyAndVisible];
}

@end
