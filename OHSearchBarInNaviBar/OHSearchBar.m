//
//  OHSearchBar.m
//  OHSearchController
//
//  Created by Xing on 2017/12/4.
//  Copyright © 2017年 HasjOH. All rights reserved.
//

#import <objc/runtime.h>
#import "OHSearchBar.h"

@interface OHSearchBar () 

@property (nonatomic, strong) UIImageView *leftView;

@end

@implementation OHSearchBar


- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton tintColor:(UIColor *)tintColor { 
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.tintColor = tintColor; //光标颜色
        self.barTintColor = [UIColor whiteColor];
        self.placeholder = placeholder;
        self.showsCancelButton = showCancelButton;
        self.leftView = leftView; // 用来代替左边的放大镜
        [self setImage:[UIImage imageNamed:@"clear"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal]; // 替换输入过程中右侧的clearIcon
        
        if ([[UIDevice currentDevice] systemVersion].doubleValue >= 11.0) {
            [[self.heightAnchor constraintEqualToConstant:44.0] setActive:YES];
        } else {
            [self setLeftPlaceholder];
        }
    }
    return self;
}

- (void)setLeftPlaceholder {
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector]) {
        BOOL centeredPlaceholder = NO;
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&centeredPlaceholder atIndex:2];
        [invocation invoke];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];

    // search field
    UITextField *searchField = [self valueForKey:@"searchField"];
    searchField.backgroundColor = DARK_BLUE_COLOR;
    searchField.textColor = [UIColor whiteColor];
    searchField.font = [UIFont systemFontOfSize:16];
    searchField.leftView = self.leftView;

    if (@available(iOS 11.0, *)) {
        // 查看视图层级，在iOS 11之前searchbar的x是12
        searchField.frame = CGRectMake(12, 8, SCREEN_WIDTH*0.8, 28);

    } else {
        searchField.frame = CGRectMake(0, 8, SCREEN_WIDTH*0.8, 28);
    }

    searchField.borderStyle = UITextBorderStyleNone;
    searchField.layer.cornerRadius = 5;

    searchField.layer.masksToBounds = YES;
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    [self setValue:searchField forKey:@"searchField"];
    
    self.searchTextPositionAdjustment = (UIOffset){10, 0}; // 光标偏移量
}

@end
