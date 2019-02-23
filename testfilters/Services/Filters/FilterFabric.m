//
//  FilterFabric.m
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import "FilterFabric.h"
#import "FilterCoreImage.h"

@implementation FilterNone

- (UIImage *)processImage:(UIImage *)image
{
    return image;
}

@end

@implementation FilterFabric

+ (id<Filter>)filterByType:(FilterType)type
{
    switch (type) {
      case FilterTypeNone:
        return [FilterNone new];
        break;
      case FilterTypeChrome:
        return [FilterCoreImage filterWithName:@"CIPhotoEffectChrome"];
        break;
      case FilterTypeInstant:
        return [FilterCoreImage filterWithName:@"CIPhotoEffectInstant"];
        break;
      case FilterTypeFade:
        return [FilterCoreImage filterWithName:@"CIPhotoEffectFade"];
        break;
      case FilterTypeMono:
        return [FilterCoreImage filterWithName:@"CIPhotoEffectMono"];
        break;
      case FilterTypeNoir:
        return [FilterCoreImage filterWithName:@"CIPhotoEffectNoir"];
        break;
      default:
        return nil;
    }
}

@end
