//
//  WelcomeViewInput.h
//	testfilters
//

@protocol WelcomeViewInput <NSObject>

- (void)setupInitialState;

@property (assign, nonatomic, readonly) UINavigationController *navigationController;

@end
