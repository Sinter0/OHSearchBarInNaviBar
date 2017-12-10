//
//  OHSearchBar.h
//  OHSearchController
//
//  Created by Xing on 2017/12/4.
//  Copyright © 2017年 HasjOH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OHSearchBar : UISearchBar


/**
 初始化方法

 @param frame frame
 @param placeholder placeholder
 @param leftView textField的leftView
 @param showCancelButton 是否显示取消按钮
 @param tintColor 光标颜色
 */
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton tintColor:(UIColor *)tintColor;

/// 让searchBar的内容居左显示
- (void)setLeftPlaceholder;

@end
