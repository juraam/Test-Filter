//
//  FiltersAssembly.m
//	testfilters
//

#import "FiltersAssembly.h"
#import "FiltersVC.h"
#import "FiltersInteractor.h"
#import "FiltersPresenter.h"
#import "FiltersRouter.h"

@implementation FiltersAssembly

+ (id <FiltersModuleInput>)createModuleWithImage:(UIImage *)image
{
    FiltersVC *view = (FiltersVC *)[[UIStoryboard main] instatiateControllerOf:[FiltersVC class]];
    FiltersInteractor *interactor = [FiltersInteractor interactorWithImage:image];
    FiltersPresenter *presenter = [FiltersPresenter new];
    FiltersRouter *router = [FiltersRouter new];
    
    router.viewController = view;
    
    view.output = presenter;
    interactor.output = presenter;
    
    presenter.view = view;
    presenter.interactor = interactor;
    presenter.router = router;
    
    return presenter;
}

@end
