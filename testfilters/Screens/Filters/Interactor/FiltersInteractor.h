//
//  FiltersInteractor.h
//	testfilters
//

#import "FiltersInteractorInput.h"
@protocol FiltersInteractorOutput;

@interface FiltersInteractor : NSObject <FiltersInteractorInput>

@property (nonatomic, weak) id<FiltersInteractorOutput> output;

+ (instancetype)interactorWithImage:(UIImage *)image;

@end

