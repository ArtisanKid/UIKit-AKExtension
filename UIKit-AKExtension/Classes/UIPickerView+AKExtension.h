//
//  UIPickerView+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/6/3.
//
//

#import <UIKit/UIKit.h>

@interface UIPickerView (AKExtension)

/**
 带有回调的reloadAllComponents方法
 
 @param complete void(^)()
 */
- (void)ak_reloadAllComponents:(dispatch_block_t)complete;

/**
 带有回调的reloadComponent方法

 @param component 组件值
 @param complete dispatch_block_t
 */
- (void)ak_reloadComponent:(NSUInteger)component complete:(dispatch_block_t)complete;

/**
 安全的选择方法
 同selectRow:inComponent:animated:

 @param row NSUInteger
 @param component NSUInteger
 @param animated BOOL
 */
- (void)ak_selectRow:(NSUInteger)row inComponent:(NSUInteger)component animated:(BOOL)animated;

@end
