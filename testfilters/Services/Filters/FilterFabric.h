//
//  FilterFabric.h
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    FilterTypeNone = 0,
    FilterTypeChrome,
    FilterTypeInstant,
    FilterTypeFade,
    FilterTypeMono,
    FilterTypeNoir
} FilterType;

@protocol Filter <NSObject>

- (UIImage *)processImage:(UIImage *)image;

@end

@interface FilterNone : NSObject <Filter>

@end

NS_ASSUME_NONNULL_BEGIN

@interface FilterFabric : NSObject

+ (id<Filter>)filterByType:(FilterType)type;

@end

NS_ASSUME_NONNULL_END
