//
//  UIKit-AKInheritConfig.m
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/21.
//

#import "UIKit-AKInheritConfig.h"

#pragma mark - 导航栏返回按钮图片

UIImage *UIViewController_AKNavigationPopItemImage = nil;

void UIViewControllerSetNavigationPopItemImage(UIImage *image) {
    UIViewController_AKNavigationPopItemImage = image;
}

#pragma mark - 导航栏返回按钮视图

UIView *UIViewController_AKNavigationPopItemView = nil;

void UIViewControllerSetNavigationPopItemView(UIView *view) {
    UIViewController_AKNavigationPopItemView = view;
}

#pragma mark - 导航栏关闭按钮图片

UIImage *UIViewController_AKNavigationCloseItemImage = nil;

void UIViewControllerSetNavigationCloseItemImage(UIImage *image) {
    UIViewController_AKNavigationCloseItemImage = image;
}

#pragma mark - 导航栏关闭按钮视图

UIView *UIViewController_AKNavigationCloseItemView = nil;

void UIViewControllerSetNavigationCloseItemView(UIView *view) {
    UIViewController_AKNavigationCloseItemView = view;
}

@implementation UIKit_AKInheritConfig

@end
