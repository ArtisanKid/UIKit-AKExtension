//
//  UIScrollView+AKProperty.m
//  Pods
//
//  Created by 李翔宇 on 3/3/15.
//
//

#import "UIScrollView+AKExtension.h"
#import <objc/runtime.h>

static const void * const UIScrollViewScrollDirectionKey = &UIScrollViewScrollDirectionKey;
static const void * const UIScrollViewLastContentOffsetKey = &UIScrollViewLastContentOffsetKey;

@implementation UIScrollView (AKExtension)

#pragma mark -
@dynamic ak_contentSizeWidth;
@dynamic ak_contentSizeHeight;

- (CGFloat)ak_contentSizeWidth {
    return self.contentSize.width;
}

- (void)setAk_contentSizeWidth:(CGFloat)width {
    CGSize size = self.contentSize;
    size.width = width;
    self.contentSize = size;
}

- (CGFloat)ak_contentSizeHeight {
    return self.contentSize.height;
}

- (void)setAk_contentSizeHeight:(CGFloat)height {
    CGSize size = self.contentSize;
    size.height = height;
    self.contentSize = size;
}

#pragma mark -
@dynamic ak_contentInsetLeft;
@dynamic ak_contentInsetTop;
@dynamic ak_contentInsetRight;
@dynamic ak_contentInsetBottom;

- (CGFloat)ak_contentInsetLeft {
    return self.contentInset.left;
}

- (void)setAk_contentInsetLeft:(CGFloat)left {
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.left = left;
    self.contentInset = edgeInsets;
}

- (CGFloat)ak_contentInsetTop {
    return self.contentInset.top;
}

- (void)setAk_contentInsetTop:(CGFloat)top {
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.top = top;
    self.contentInset = edgeInsets;
}

- (CGFloat)ak_contentInsetRight {
    return self.contentInset.right;
}

- (void)setAk_contentInsetRight:(CGFloat)right {
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.right = right;
    self.contentInset = edgeInsets;
}

- (CGFloat)ak_contentInsetBottom {
    return self.contentInset.bottom;
}

- (void)setAk_contentInsetBottom:(CGFloat)bottom {
    UIEdgeInsets edgeInsets = self.contentInset;
    edgeInsets.bottom = bottom;
    self.contentInset = edgeInsets;
}

#pragma mark -
@dynamic ak_contentOffsetX;
@dynamic ak_contentOffsetY;

- (CGFloat)ak_contentOffsetX {
    return self.contentOffset.x;
}

- (void)setAk_contentOffsetX:(CGFloat)x {
    CGPoint point = self.contentOffset;
    point.x = x;
    self.contentOffset = point;
}

- (CGFloat)ak_contentOffsetY {
    return self.contentOffset.y;
}

- (void)setAk_contentOffsetY:(CGFloat)y {
    CGPoint point = self.contentOffset;
    point.y = y;
    self.contentOffset = point;
}

- (AKScrollDirection)ak_scrollDirection {
    return [objc_getAssociatedObject(self, UIScrollViewScrollDirectionKey) intValue];
}

- (void)setAk_scrollDirection:(AKScrollDirection)ak_scrollDirection {
    if(ak_scrollDirection == AKScrollDirectionNone) {
        objc_removeAssociatedObjects(self);
    } else {
        objc_setAssociatedObject(self, UIScrollViewScrollDirectionKey, @(ak_scrollDirection), OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)ak_hookScrollViewDirection {    
    Method originMethod = class_getInstanceMethod(UIScrollView.class, @selector(setContentOffset:));
    Method hookMethod = class_getInstanceMethod(UIScrollView.class, @selector(setAk_contentOffset:));
    method_exchangeImplementations(originMethod, hookMethod);
}

- (void)setAk_contentOffset:(CGPoint)contentOffset {
    [self setAk_contentOffset:contentOffset];
    
    NSValue *value = objc_getAssociatedObject(self, UIScrollViewLastContentOffsetKey);
    CGPoint lastContentOffset = value.CGPointValue;
    NSValue *currentValue = [NSValue valueWithCGPoint:self.contentOffset];
    objc_setAssociatedObject(self, UIScrollViewLastContentOffsetKey, currentValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    AKScrollDirection direction = AKScrollDirectionNone;
    if(self.contentOffset.x > lastContentOffset.x) {
        direction |= AKScrollDirectionLeft;
    } else if(self.contentOffset.x < lastContentOffset.x) {
        direction |= AKScrollDirectionRight;
    }
    if(self.contentOffset.y > lastContentOffset.y) {
        direction |= AKScrollDirectionUp;
    } else if(self.contentOffset.y < lastContentOffset.y) {
        direction |= AKScrollDirectionDown;
    }
    if(direction == AKScrollDirectionNone) {
        return;
    }
    
    self.ak_scrollDirection = direction;
}

@end
