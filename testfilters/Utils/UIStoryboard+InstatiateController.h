//
//  UIStoryboard+InstatiateController.h
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStoryboard (InstatiateController)

+ (instancetype)main;
    
- (UIViewController *)instatiateControllerOf: (Class)className;

@end

NS_ASSUME_NONNULL_END
