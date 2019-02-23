//
//  FiltersViewModel.m
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import "FiltersViewModel.h"

@implementation FiltersViewModel

+ (instancetype)viewModelWithTitle:(NSString *)title type:(FilterType)type
{
    FiltersViewModel *viewModel = [FiltersViewModel new];
    viewModel.title = title;
    viewModel.type = type;
    return viewModel;
}

@end
