//
//  WelcomeAssembly.m
//	testfilters
//

#import "WelcomeAssembly.h"
#import "WelcomeVC.h"
#import "WelcomeInteractor.h"
#import "WelcomePresenter.h"
#import "WelcomeRouter.h"

@implementation WelcomeAssembly

+ (id <WelcomeModuleInput>)createModule
{
    WelcomeVC *view = (WelcomeVC *)[[UIStoryboard main] instatiateControllerOf:[WelcomeVC class]];
    WelcomeInteractor *interactor = [WelcomeInteractor new];
    WelcomePresenter *presenter = [WelcomePresenter new];
    WelcomeRouter *router = [WelcomeRouter new];
    
    router.viewController = view;
    
    view.output = presenter;
    interactor.output = presenter;
    
    presenter.view = view;
    presenter.interactor = interactor;
    presenter.router = router;
    
    return presenter;
}

@end
