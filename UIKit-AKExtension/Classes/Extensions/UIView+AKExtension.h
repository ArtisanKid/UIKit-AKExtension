//
//  UIView+AKProperty.h
//  Pods
//
//  Created by 李翔宇 on 3/2/15.
//
//

#import <UIKit/UIKit.h>

@interface UIView (AKExtension)

#pragma mark - Quick Access

@property (nonatomic, assign) CGFloat ak_left;
@property (nonatomic, assign) CGFloat ak_top;
@property (nonatomic, assign) CGFloat ak_right;
@property (nonatomic, assign) CGFloat ak_bottom;

@property (nonatomic, assign) CGFloat ak_x;
@property (nonatomic, assign) CGFloat ak_y;
@property (nonatomic, assign) CGFloat ak_width;
@property (nonatomic, assign) CGFloat ak_height;

@property (nonatomic, assign) CGFloat ak_centerX;
@property (nonatomic, assign) CGFloat ak_centerY;

@property (nonatomic, assign) CGPoint ak_origin;
@property (nonatomic, assign) CGSize ak_size;

#pragma mark - 圆角设置，非离屏渲染

/** 以下属性方法都是替换方法，后设置的圆角会替换前面设置的圆角，并非增量设置 */

@property (nonatomic, assign) CGFloat ak_topLeftCornerRadius;/**<左上角圆角*/
@property (nonatomic, assign) CGFloat ak_topRightCornerRadius;/**<右上角圆角*/
@property (nonatomic, assign) CGFloat ak_bottomLeftCornerRadius;/**<左下角圆角*/
@property (nonatomic, assign) CGFloat ak_bottomRightCornerRadius;/**<右下角圆角*/
@property (nonatomic, assign) CGFloat ak_topCornerRadius;/**<左上右上角圆角*/
@property (nonatomic, assign) CGFloat ak_bottomCornerRadius;/**<左下右下角圆角*/
@property (nonatomic, assign) CGFloat ak_leftCornerRadius;/**<左上左下角圆角*/
@property (nonatomic, assign) CGFloat ak_rightCornerRadius;/**<右上右下角圆角*/
@property (nonatomic, assign) UIRectCorner ak_roundingCorners;/**<当前圆角*/
@property (nonatomic, assign) CGFloat ak_cornerRadius;/**<当前圆角半径*/

/**
 设置圆角

 @param corner 角
 @param radius 半径
 */
- (void)ak_makeCorner:(UIRectCorner)corner radius:(CGFloat)radius;

#pragma mark - Quick Method
- (UIView *)ak_findFirstResponder;
- (void)ak_removeAllSubviews;
- (UIViewController *)ak_controller;

#pragma mark Content压缩与拉伸属性
- (void)setAk_forbidCompress:(BOOL)forbid;
- (void)setAk_forbidStretch:(BOOL)forbid;
- (void)ak_absoluteAdjustAxis:(UILayoutConstraintAxis)axis;

@end
