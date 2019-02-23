//
//  FilterCoreImage.h
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FilterFabric.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterCoreImage : NSObject<Filter>

+ (instancetype)filterWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
