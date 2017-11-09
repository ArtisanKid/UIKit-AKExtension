//
//  UINavigationBar+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/3/1.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (AKExtension)

/**
 *  更改导航栏背景颜色
 *  UIColor.clearColor才能使背景透明
 */
@property (nullable, nonatomic, strong) UIColor *ak_backgroundColor;

- (void)ak_clearBackgroundColor;

@end

NS_ASSUME_NONNULL_END
