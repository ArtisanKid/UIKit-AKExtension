//
//  UIView+AKProperty.m
//  Pods
//
//  Created by 李翔宇 on 3/2/15.
//
//

#import "UIView+AKExtension.h"
#import <objc/runtime.h>

@implementation UIView (AKExtension)

#pragma mark - Quick Access


@dynamic ak_left;
@dynamic ak_top;
@dynamic ak_right;
@dynamic ak_bottom;

- (CGFloat)ak_left {
    return self.frame.origin.x;
}

- (void)setAk_left:(CGFloat)left {
    CGRect frame = self.frame;
    frame.size.width -= (left - frame.origin.x);
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)ak_top {
    return self.frame.origin.y;
}

- (void)setAk_top:(CGFloat)top {
    CGRect frame = self.frame;
    frame.size.height -= (top - frame.origin.y);
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)ak_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setAk_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.size.width += (right - frame.size.width);
    self.frame = frame;
}

- (CGFloat)ak_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setAk_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.size.height += (bottom - (frame.origin.y + frame.size.height));
    self.frame = frame;
}

#pragma mark -
@dynamic ak_x;
@dynamic ak_y;
@dynamic ak_width;
@dynamic ak_height;

- (CGFloat)ak_x {
    return self.frame.origin.x;
}

- (void)setAk_x:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)ak_y {
    return self.frame.origin.y;
}

- (void)setAk_y:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)ak_width {
    return self.frame.size.width;
}

- (void)setAk_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)ak_height {
    return self.frame.size.height;
}

- (void)setAk_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark -
@dynamic ak_centerX;
@dynamic ak_centerY;

- (CGFloat)ak_centerX {
    return self.center.x;
}

- (void)setAk_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)ak_centerY {
    return self.center.y;
}

- (void)setAk_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark -
@dynamic ak_origin;
@dynamic ak_size;

- (CGPoint)ak_origin {
    return self.frame.origin;
}

- (void)setAk_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)ak_size {
    return self.frame.size;
}

- (void)setAk_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

typedef NS_OPTIONS(NSUInteger, AKRectCorner) {
    AKRectCornerNull = 0
};

#pragma mark - 圆角
- (void)setAk_topLeftCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerTopLeft radius:radius];
}

- (void)setAk_topRightCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerTopRight radius:radius];
}

- (void)setAk_bottomLeftCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerBottomLeft radius:radius];
}

- (void)setAk_bottomRightCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerBottomRight radius:radius];
}

- (void)setAk_topCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerTopLeft|UIRectCornerTopRight radius:radius];
}

- (void)setAk_bottomCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerBottomLeft|UIRectCornerBottomRight radius:radius];
}

- (void)setAk_leftCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerTopLeft|UIRectCornerBottomLeft radius:radius];
}

- (void)setAk_rightCornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerTopRight|UIRectCornerBottomRight radius:radius];
}

- (CGFloat)ak_topLeftCornerRadius { return self.ak_cornerRadius; }
- (CGFloat)ak_topRightCornerRadius { return self.ak_cornerRadius; }
- (CGFloat)ak_bottomLeftCornerRadius { return self.ak_cornerRadius; }
- (CGFloat)ak_bottomRightCornerRadius { return self.ak_cornerRadius; }
- (CGFloat)ak_topCornerRadius { return self.ak_cornerRadius; }
- (CGFloat)ak_bottomCornerRadius { return self.ak_cornerRadius; }
- (CGFloat)ak_leftCornerRadius { return self.ak_cornerRadius; }
- (CGFloat)ak_rightCornerRadius { return self.ak_cornerRadius; }

static const void * const UIView_AKRoundingCornersKey = &UIView_AKRoundingCornersKey;

- (UIRectCorner)ak_roundingCorners {
    return [objc_getAssociatedObject(self, UIView_AKRoundingCornersKey) integerValue];
}

- (void)setAk_roundingCorners:(UIRectCorner)corner {
    objc_setAssociatedObject(self, UIView_AKRoundingCornersKey, @(corner), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static const void * const UIView_AKCornerRadiusKey = &UIView_AKCornerRadiusKey;

- (CGFloat)ak_cornerRadius {
    return [objc_getAssociatedObject(self, UIView_AKCornerRadiusKey) integerValue];
}

- (void)setAk_cornerRadius:(CGFloat)radius {
    [self ak_makeCorner:UIRectCornerAllCorners radius:radius];
    objc_setAssociatedObject(self, UIView_AKCornerRadiusKey, @(radius), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)ak_makeCorner:(UIRectCorner)corner radius:(CGFloat)radius {
    self.ak_roundingCorners = corner;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corner
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

#pragma mark - Quick Method
- (UIView *)ak_findFirstResponder {
    if (self.isFirstResponder) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView ak_findFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}

- (void)ak_removeAllSubviews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (UIViewController *)ak_controller {
    UIView *view = self;
    while (view.superview) {
        view = view.superview;
    }
    UIResponder *nextResponder = view.nextResponder;
    if(![nextResponder isKindOfClass:[UIViewController class]]) {
        return nil;
    }
    return nextResponder;
}

- (void)setAk_forbidCompress:(BOOL)forbid {
    if(forbid) {
        [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    } else {
        [self setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [self setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    }
    
}
- (void)setAk_forbidStretch:(BOOL)forbid {
    if(forbid) {
        [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    } else {
        [self setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [self setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    }
}

- (void)ak_absoluteAdjustAxis:(UILayoutConstraintAxis)axis {
    [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:axis];
    [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:axis];
}

@end
