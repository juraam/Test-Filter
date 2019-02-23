//
//  FiltersViewInput.h
//	testfilters
//

@protocol FiltersViewInput <NSObject>

- (void)setupInitialState;

- (void)updateImage:(UIImage *)image;

- (void)updateFilters:(NSArray *)filters;

@end
