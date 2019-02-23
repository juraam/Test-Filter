//
//  FiltersViewOutput.h
//	testfilters
//
#import "FilterFabric.h"

@protocol FiltersViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;

- (void)didSelectType:(FilterType)type;

@end
