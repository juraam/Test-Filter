//
//  FiltersCell.m
//  testfilters
//
//  Created by Jura Moshkov on 22/02/2019.
//  Copyright © 2019 Jura Moshkov. All rights reserved.
//

#import "FiltersCell.h"

@interface FiltersCell ()

@property (nonatomic, weak) IBOutlet UIView *border;

@end

@implementation FiltersCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.border.layer.borderColor = UIColor.blackColor.CGColor;
    self.border.layer.borderWidth = 0.5;
}

@end
