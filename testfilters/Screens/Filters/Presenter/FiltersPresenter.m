//
//  FiltersPresenter.m
//	testfilters
//

#import "FiltersPresenter.h"
#import "FiltersViewInput.h"
#import "FiltersInteractorInput.h"
#import "FiltersModuleOutput.h"
#import "FiltersRouterInput.h"

@interface FiltersPresenter ()

@end

@implementation FiltersPresenter

#pragma mark - <ModuleInput>

- (void)presentModuleFromNavigationController:(UINavigationController *)controller
{
    [self.router presentModuleFromNavigationController:controller];
}

#pragma mark - <ViewOutput>

- (void)didTriggerViewReadyEvent
{
    [self.view setupInitialState];
    [self.interactor loadData];
}

- (void)didSelectType:(FilterType)type
{
    [self.interactor didSelectType:type];
}

#pragma mark - <InteractorOutput>

- (void)updateImage:(UIImage *)image
{
    [self.view updateImage:image];
}

- (void)updateFilters:(NSArray *)filters
{
    [self.view updateFilters:filters];
}

@end
