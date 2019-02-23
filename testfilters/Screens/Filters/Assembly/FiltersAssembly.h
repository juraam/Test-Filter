//
//  FiltersAssembly.h
//	testfilters
//

#import "FiltersModuleInput.h"

@interface FiltersAssembly : NSObject

+ (id <FiltersModuleInput>)createModuleWithImage:(UIImage *)image;

@end
