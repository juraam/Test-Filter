//
//  FilterService.h
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FilterFabric.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterService : NSObject

+ (instancetype)serviceWithImage:(UIImage *)image;

- (void)processImageWithType:(FilterType)type completion:(void (^)(UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
