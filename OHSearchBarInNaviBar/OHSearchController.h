//
//  OHSearchController.h
//  OHSearchController
//
//  Created by Xing on 2017/12/4.
//  Copyright © 2017年 HasjOH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OHSearchBar.h"

@interface OHSearchController : UISearchController

@property (nonatomic, strong) OHSearchBar *ohSearchBar;

- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController searchBarFrame:(CGRect)frame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton barTintColor:(UIColor *)barTintColor;

@end
