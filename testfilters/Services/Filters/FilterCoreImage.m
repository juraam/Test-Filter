//
//  FilterCoreImage.m
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import <CoreImage/CoreImage.h>

#import "FilterCoreImage.h"

@interface FilterCoreImage ()

@property (nonatomic, copy) NSString *name;

@end

@implementation FilterCoreImage

+ (instancetype)filterWithName:(NSString *)name
{
    FilterCoreImage *filter = [FilterCoreImage new];
    filter.name = name;
    return filter;
}

- (UIImage *)processImage:(UIImage *)image
{
    CIContext *context = [CIContext contextWithOptions:nil];

    CIImage *ciImage = [[CIImage alloc] initWithImage:image];

    CIFilter *filter = [CIFilter filterWithName:self.name];

    [filter setValue:ciImage forKey:kCIInputImageKey];

    CIImage *result = [filter valueForKey:kCIOutputImageKey];

    CGRect extent = [result extent];

    CGImageRef cgImage = [context createCGImage:result fromRect:extent];

    UIImage *filteredImage = [[UIImage alloc] initWithCGImage:cgImage];

    return filteredImage;
}

@end
