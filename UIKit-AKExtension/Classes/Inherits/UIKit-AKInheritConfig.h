//
//  UIKit-AKInheritConfig.h
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/21.
//

#import <UIKit/UIKit.h>

#pragma mark - 导航栏返回按钮图片

UIKIT_EXTERN UIImage *UIViewController_AKNavigationPopItemImage;

/**
 配置导航返回按钮图片
 
 @param image 图片
 */
UIKIT_EXTERN void UIViewControllerSetNavigationPopItemImage(UIImage *image);

#pragma mark - 导航栏返回按钮视图

UIKIT_EXTERN UIView *UIViewController_AKNavigationPopItemView;

/**
 配置导航返回按钮视图
 
 @param view 图片
 */
UIKIT_EXTERN void UIViewControllerSetNavigationPopItemView(UIView *view);

#pragma mark - 导航栏关闭按钮图片

UIKIT_EXTERN UIImage *UIViewController_AKNavigationCloseItemImage;

/**
 配置导航关闭按钮图片
 
 @param image 图片
 */
UIKIT_EXTERN void UIViewControllerSetNavigationCloseItemImage(UIImage *image);

#pragma mark - 导航栏关闭按钮视图

UIKIT_EXTERN UIView *UIViewController_AKNavigationCloseItemView;

/**
 配置导航关闭按钮视图
 
 @param view 视图
 */
UIKIT_EXTERN void UIViewControllerSetNavigationCloseItemView(UIView *view);

@interface UIKit_AKInheritConfig : NSObject

@end
