//
//  FiltersRouter.m
//	testfilters
//

#import "FiltersRouter.h"
#import "FiltersPresenter.h"

@interface FiltersRouter ()

@end

@implementation FiltersRouter

- (void)presentModuleFromNavigationController:(UINavigationController *)controller
{
    [controller pushViewController:self.viewController animated:YES];
}

@end
