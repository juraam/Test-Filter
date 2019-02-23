//
//  WelcomeViewOutput.h
//	testfilters
//

@protocol WelcomeViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;

- (void)didShootImage:(UIImage *)image;

- (void)galleryAction;

@end
