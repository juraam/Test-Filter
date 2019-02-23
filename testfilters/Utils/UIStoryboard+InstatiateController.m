//
//  UIStoryboard+InstatiateController.m
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import "UIStoryboard+InstatiateController.h"

@implementation UIStoryboard (InstatiateController)

+ (instancetype)main
{
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

- (UIViewController *)instatiateControllerOf:(Class)className
{
    return [self instantiateViewControllerWithIdentifier:NSStringFromClass(className)];
}

@end
