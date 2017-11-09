//
//  UIImageView+AKRewrite.m
//  Pods
//
//  Created by 李翔宇 on 15/8/7.
//
//

#import "UIImageView+AKExtension.h"
#import <objc/runtime.h>

static const void * const UIImageViewAlwayShowInScrollViewKey = &UIImageViewAlwayShowInScrollViewKey;

@implementation UIImageView (AKExtension)

@dynamic ak_alwayShowInScrollView;

- (void)setAk_alwayShowInScrollView:(BOOL)alwayShowForScrollView {
    objc_setAssociatedObject(self, UIImageViewAlwayShowInScrollViewKey, @(alwayShowForScrollView), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)ak_alwayShowInScrollView {
    return [objc_getAssociatedObject(self, UIImageViewAlwayShowInScrollViewKey) boolValue];
}

/**
 *  重写setAlpha:方法，目标是支持UIScrollView能永远显示导航条
 */
- (void)setAlpha:(CGFloat)alpha {
    if (self.ak_alwayShowInScrollView){
        [super setAlpha:1.];
    } else {
        [super setAlpha:alpha];
    }
}

@end
