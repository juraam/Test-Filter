//
//  WelcomePresenter.m
//	testfilters
//

#import "WelcomePresenter.h"
#import "WelcomeViewInput.h"
#import "WelcomeInteractorInput.h"
#import "WelcomeModuleOutput.h"
#import "WelcomeRouterInput.h"

#import "FiltersAssembly.h"

@interface WelcomePresenter () <UIImagePickerControllerDelegate>

@end

@implementation WelcomePresenter

#pragma mark - Private

- (void)presentFilterModuleWithImage:(UIImage *)image
{
    id module = [FiltersAssembly createModuleWithImage:image];
    [module presentModuleFromNavigationController:self.view.navigationController];
}

#pragma mark - <ModuleInput>
    
- (void)presentModuleFromWindow:(UIWindow *)window
{
    [self.router presentModuleFromWindow:window];
}

#pragma mark - <ViewOutput>

- (void)didTriggerViewReadyEvent
{
    [self.view setupInitialState];
}

- (void)galleryAction
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.delegate = self;
        [self.view.navigationController presentViewController:imagePicker animated:true completion:nil];
    }
}

- (void)didShootImage:(UIImage *)image
{
    [self presentFilterModuleWithImage:image];
}

#pragma mark - <UIImagePickerControllerDelegate>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self presentFilterModuleWithImage:image];
    [self.view.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.view.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - <InteractorOutput>



@end
