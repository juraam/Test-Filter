//
//  FiltersViewModel.h
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FilterFabric.h"

NS_ASSUME_NONNULL_BEGIN

@interface FiltersViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) FilterType type;

+ (instancetype)viewModelWithTitle:(NSString *)title type:(FilterType)type;

@end

NS_ASSUME_NONNULL_END
