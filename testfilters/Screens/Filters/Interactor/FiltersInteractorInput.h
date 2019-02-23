//
//  FiltersInteractorInput.h
//	testfilters
//
#import "FilterFabric.h"

@protocol FiltersInteractorInput <NSObject>

- (void)loadData;

- (void)didSelectType:(FilterType)type;

@end
