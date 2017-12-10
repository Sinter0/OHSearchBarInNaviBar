//
//  OHSearchViewController.m
//  OHSearchController
//
//  Created by Xing on 2017/12/4.
//  Copyright © 2017年 HasjOH. All rights reserved.
//

#import "OHSearchViewController.h"
#import "OHSearchController.h"

@interface OHSearchViewController () <UISearchBarDelegate>

@property (nonatomic, strong) OHSearchController *ohSearchController;

@end

@implementation OHSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"搜索页";
    label.font = [UIFont systemFontOfSize:30];
    [label sizeToFit];
    label.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    [self.view addSubview:label];
    
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    leftView.bounds = CGRectMake(0, 0, 24, 24);
    self.ohSearchController = [[OHSearchController alloc] initWithSearchResultsController:self
                                                                           searchBarFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)
                                                                              placeholder:@"请输入搜索内容进行搜索"
                                                                        textFieldLeftView:leftView
                                                                         showCancelButton:YES
                                                                             barTintColor:BASE_BLUE_COLOR];
    
    [self.ohSearchController.ohSearchBar becomeFirstResponder];
    self.ohSearchController.ohSearchBar.delegate = self;
    [self.ohSearchController.ohSearchBar setLeftPlaceholder];
    self.navigationItem.titleView = self.ohSearchController.ohSearchBar;
    self.navigationItem.hidesBackButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.ohSearchController.ohSearchBar resignFirstResponder];
    // 让取消按钮一直处于激活状态
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"];
    cancelBtn.enabled = YES;
}

@end
