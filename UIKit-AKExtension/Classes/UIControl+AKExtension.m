//
//  UIControl+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 2016/10/31.
//
//

#import "UIControl+AKExtension.h"
#import <objc/runtime.h>

static const void * const UIControlExpandTouchKey = &UIControlExpandTouchKey;

@implementation UIControl (AKExtension)

//+ (void)load {
//    Method originMethod = class_getInstanceMethod(self, @selector(pointInside:withEvent:));
//    Method targetMethod = class_getInstanceMethod(self, @selector(ak_pointInside:withEvent:));
//    method_exchangeImplementations(originMethod, targetMethod);
//}

- (void)setAk_expandTouchEdgeInsets:(UIEdgeInsets)edgeInsets {
    NSValue *value = [NSValue value:&edgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, UIControlExpandTouchKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)ak_expandTouchEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, UIControlExpandTouchKey);
    if (!value) {
        return UIEdgeInsetsZero;
    }
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsZero;
    [value getValue:&edgeInsets];
    return edgeInsets;
}

#pragma mark - 重载
- (BOOL)ak_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL result = [self ak_pointInside:point withEvent:event];
    
    if(result
       || !self.isEnabled
       || !self.isUserInteractionEnabled
       || self.isHidden
       || UIEdgeInsetsEqualToEdgeInsets(self.ak_expandTouchEdgeInsets, UIEdgeInsetsZero)) {
        return result;
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.ak_expandTouchEdgeInsets);
    return CGRectContainsPoint(hitFrame, point);
}

@end
