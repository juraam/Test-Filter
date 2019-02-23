//
//  FiltersInteractor.m
//	testfilters
//

#import "FiltersInteractor.h"
#import "FiltersInteractorOutput.h"

#import "FiltersViewModel.h"
#import "FilterService.h"

@interface FiltersInteractor ()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) FilterService *service;

@end

@implementation FiltersInteractor

+ (instancetype)interactorWithImage:(UIImage *)image
{
    FiltersInteractor *instance = [[self alloc] init];
    instance.image = image;
    return instance;
}

#pragma mark - <Input>

- (void)loadData
{
    [self.output updateImage:self.image];
    NSArray *viewModels = @[
        [FiltersViewModel viewModelWithTitle:@"Нет фильтра" type:FilterTypeNone],
        [FiltersViewModel viewModelWithTitle:@"Chrome" type:FilterTypeChrome],
        [FiltersViewModel viewModelWithTitle:@"Instant" type:FilterTypeInstant],
        [FiltersViewModel viewModelWithTitle:@"Fade" type:FilterTypeFade],
        [FiltersViewModel viewModelWithTitle:@"Mono" type:FilterTypeMono],
        [FiltersViewModel viewModelWithTitle:@"Noir" type:FilterTypeNoir],
    ];
    [self.output updateFilters:viewModels];
}

- (void)didSelectType:(FilterType)type
{
    __weak FiltersInteractor *weakSelf = self;
    [self.service processImageWithType:type completion:^(UIImage *image) {
        [weakSelf.output updateImage:image];
    }];
}

#pragma mark - <Lazy>

- (FilterService *)service
{
    if (_service == nil) {
        _service = [FilterService serviceWithImage:self.image];
    }
    return _service;
}

@end
