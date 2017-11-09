//
//  UINavigationBar+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/3/1.
//
//

#import "UINavigationBar+AKExtension.h"
#import <objc/runtime.h>
#import "UIImage+AKExtension.h"

static const void * const UINavigationBarBackgroundColorKey = &UINavigationBarBackgroundColorKey;

@implementation UINavigationBar (AKExtension)

@dynamic ak_backgroundColor;

- (UIColor *)ak_backgroundColor {
    return objc_getAssociatedObject(self, UINavigationBarBackgroundColorKey);
}

- (void)setAk_backgroundColor:(UIColor *)color {
    if([self.ak_backgroundColor isEqual:color]) {
        return;
    }
    
    objc_setAssociatedObject(self, UINavigationBarBackgroundColorKey, color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (color) {
        [self setBackgroundImage:[UIImage ak_imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = [UIImage ak_imageWithColor:color];
    } else {
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = nil;
    }
}

- (void)ak_clearBackgroundColor {
    self.ak_backgroundColor = UIColor.clearColor;
}

@end
