//2C3235
//  AppDelegate.m
//  OHSearchController
//
//  Created by Xing on 2017/12/4.
//  Copyright © 2017年 HasjOH. All rights reserved.
//

#import "AppDelegate.h"
#import "OHHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    OHHomeViewController *homeViewController = [[OHHomeViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    navigationController.navigationBar.barTintColor = BASE_BLUE_COLOR;
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
