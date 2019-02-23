//
//  FiltersVC.h
//	testfilters
//

#import "FiltersViewInput.h"
@protocol FiltersViewOutput;

@interface FiltersVC : UIViewController <FiltersViewInput>

@property (nonatomic, strong) id<FiltersViewOutput> output;

@end
