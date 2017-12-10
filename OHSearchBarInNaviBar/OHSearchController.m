//
//  OHSearchController.m
//  OHSearchController
//
//  Created by Xing on 2017/12/4.
//  Copyright © 2017年 HasjOH. All rights reserved.
//

#import "OHSearchController.h"

@interface OHSearchController ()

@end

@implementation OHSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dimsBackgroundDuringPresentation = NO;
}

- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController searchBarFrame:(CGRect)searchBarFrame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton barTintColor:(UIColor *)barTintColor{
    if (self = [super initWithSearchResultsController:searchResultsController]) {
        self.ohSearchBar = [[OHSearchBar alloc] initWithFrame:searchBarFrame
                                                  placeholder:placeholder
                                            textFieldLeftView:leftView
                                             showCancelButton:YES
                                                    tintColor:barTintColor];
        
        UIButton *button = [self.ohSearchBar valueForKey:@"cancelButton"];
        button.tintColor = [UIColor whiteColor];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [self.ohSearchBar setValue:button forKey:@"cancelButton"];
    }
    return self;
}


@end
