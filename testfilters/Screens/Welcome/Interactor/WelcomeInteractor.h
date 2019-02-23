//
//  WelcomeInteractor.h
//	testfilters
//

#import "WelcomeInteractorInput.h"
@protocol WelcomeInteractorOutput;

@interface WelcomeInteractor : NSObject <WelcomeInteractorInput>

@property (nonatomic, weak) id<WelcomeInteractorOutput> output;

@end

