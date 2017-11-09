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
@property (nonatomic, assign) CGFloat ak_topLeftCornerRadius;
@property (nonatomic, assign) CGFloat ak_topRightCornerRadius;
@property (nonatomic, assign) CGFloat ak_bottomLeftCornerRadius;
@property (nonatomic, assign) CGFloat ak_bottomRightCornerRadius;
@property (nonatomic, assign) CGFloat ak_cornerRadius;

#pragma mark - Quick Method
- (UIView *)ak_findFirstResponder;
- (void)ak_removeAllSubviews;

#pragma mark Content压缩与拉伸属性
- (void)setAk_forbidCompress:(BOOL)forbid;
- (void)setAk_forbidStretch:(BOOL)forbid;
- (void)ak_absoluteAdjustAxis:(UILayoutConstraintAxis)axis;

@end
