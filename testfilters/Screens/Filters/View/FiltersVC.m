//
//  FiltersVC.m
//	testfilters
//

#import "FiltersVC.h"
#import "FiltersViewOutput.h"

#import "FiltersCell.h"
#import "FiltersViewModel.h"

@interface FiltersVC () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *filters;

@end

@implementation FiltersVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(self.collectionView.frame.size.height, self.collectionView.frame.size.height);
    self.collectionView.collectionViewLayout = layout;
}

#pragma mark - Actions

- (IBAction)exportAction:(id)sender
{
    NSMutableArray *activityItems = [NSMutableArray arrayWithObjects:self.imageView.image, nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}

#pragma mark - <ViewInput>

- (void)setupInitialState
{
}

- (void)updateFilters:(NSArray *)filters
{
    self.filters = filters;
    [self.collectionView reloadData];
}

- (void)updateImage:(UIImage *)image
{
    self.imageView.image = image;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FiltersViewModel *viewModel = [self.filters objectAtIndex:indexPath.row];
    [self.output didSelectType:viewModel.type];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.filters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FiltersCell *cell = (FiltersCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    FiltersViewModel *viewModel = [self.filters objectAtIndex:indexPath.row];
    cell.label.text = viewModel.title;
    return cell;
}

@end
