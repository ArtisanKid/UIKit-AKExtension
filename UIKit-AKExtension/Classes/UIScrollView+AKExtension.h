//
//  UIScrollView+AKProperty.h
//  Pods
//
//  Created by 李翔宇 on 3/3/15.
//
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, AKScrollDirection) {
    AKScrollDirectionNone = 0,
    AKScrollDirectionUp = 1 << 0,
    AKScrollDirectionDown = 1 << 1,
    AKScrollDirectionLeft = 1 << 2,
    AKScrollDirectionRight = 1 << 3
};

@interface UIScrollView (AKExtension)

@property (nonatomic, assign) CGFloat ak_contentSizeWidth;
@property (nonatomic, assign) CGFloat ak_contentSizeHeight;

@property (nonatomic, assign) CGFloat ak_contentInsetLeft;
@property (nonatomic, assign) CGFloat ak_contentInsetTop;
@property (nonatomic, assign) CGFloat ak_contentInsetRight;
@property (nonatomic, assign) CGFloat ak_contentInsetBottom;

@property (nonatomic, assign) CGFloat ak_contentOffsetX;
@property (nonatomic, assign) CGFloat ak_contentOffsetY;

/**
 只有调用此方法之后才可以获得正确的滚动方向
 */
- (void)ak_hookScrollViewDirection;

@property(nonatomic, assign) AKScrollDirection ak_scrollDirection;

@end
