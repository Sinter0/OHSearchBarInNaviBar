//
//  OHHomeViewController.m
//  OHSearchController
//
//  Created by Xing on 2017/12/4.
//  Copyright © 2017年 HasjOH. All rights reserved.
//

#import "OHHomeViewController.h"
#import "OHSearchBar.h"
#import "OHSearchViewController.h"

@interface OHHomeViewController () <UISearchBarDelegate>

@property (nonatomic, strong) OHSearchBar *ohSearchBar;

@end

@implementation OHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"首页";
    label.font = [UIFont systemFontOfSize:30];
    [label sizeToFit];
    label.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    [self.view addSubview:label];
    
    // navigation buttom
    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [messageButton setImage:[UIImage imageNamed:@"msg"] forState:UIControlStateNormal];
    messageButton.bounds = CGRectMake(0, 0, 30, 30);
    UIBarButtonItem *messageBarButton = [[UIBarButtonItem alloc] initWithCustomView:messageButton];
    self.navigationItem.rightBarButtonItem = messageBarButton;
    
    // search bar
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scan"]];
    leftView.bounds = CGRectMake(0, 0, 24, 24);
    self.ohSearchBar = [[OHSearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)
                                              placeholder:@"点击我跳转"
                                        textFieldLeftView:leftView
                                         showCancelButton:NO
                                                tintColor:[UIColor clearColor]];
    self.navigationItem.titleView = self.ohSearchBar;
    self.ohSearchBar.delegate = self;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    OHSearchViewController *ohSearchViewController = [[OHSearchViewController alloc] init];
    [self.navigationController pushViewController:ohSearchViewController animated:NO];
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.ohSearchBar resignFirstResponder];
}

@end
