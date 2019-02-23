//
//  FiltersPresenter.h
//	testfilters
//

#import "FiltersViewOutput.h"
#import "FiltersInteractorOutput.h"
#import "FiltersModuleInput.h"

@protocol FiltersViewInput;
@protocol FiltersInteractorInput;
@protocol FiltersRouterInput;
@protocol FiltersModuleOutput;

@interface FiltersPresenter : NSObject <FiltersInteractorOutput, FiltersModuleInput, FiltersViewOutput>

@property (nonatomic, weak) id <FiltersViewInput> view;
@property (nonatomic, strong) id <FiltersInteractorInput> interactor;
@property (nonatomic, strong) id <FiltersRouterInput> router;
@property (nonatomic, weak) id <FiltersModuleOutput> output;

@end
