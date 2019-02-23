//
//  FiltersInteractorOutput.h
//	testfilters
//

@protocol FiltersInteractorOutput <NSObject>

- (void)updateImage:(UIImage *)image;

- (void)updateFilters:(NSArray *)filters;

@end
