//
//  WelcomeVC.h
//	testfilters
//

#import "WelcomeViewInput.h"
@protocol WelcomeViewOutput;

@interface WelcomeVC : UIViewController <WelcomeViewInput>

@property (nonatomic, strong) id<WelcomeViewOutput> output;

@end
