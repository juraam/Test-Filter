//
//  WelcomePresenter.h
//	testfilters
//

#import "WelcomeViewOutput.h"
#import "WelcomeInteractorOutput.h"
#import "WelcomeModuleInput.h"

@protocol WelcomeViewInput;
@protocol WelcomeInteractorInput;
@protocol WelcomeRouterInput;
@protocol WelcomeModuleOutput;

@interface WelcomePresenter : NSObject <WelcomeInteractorOutput, WelcomeModuleInput, WelcomeViewOutput>

@property (nonatomic, weak) id <WelcomeViewInput> view;
@property (nonatomic, strong) id <WelcomeInteractorInput> interactor;
@property (nonatomic, strong) id <WelcomeRouterInput> router;
@property (nonatomic, weak) id <WelcomeModuleOutput> output;

@end
