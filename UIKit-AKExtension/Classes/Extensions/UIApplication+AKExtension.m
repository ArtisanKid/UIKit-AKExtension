//
//  UIApplication+AKExtension.m
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/25.
//

#import "UIApplication+AKExtension.h"

@implementation UIApplication (AKExtension)

- (UIWindow *)ak_availableWindow {
    for(NSInteger index = self.windows.count - 1; index >= 0; index--) {
        UIWindow *window = self.windows[index];
        if(!window.isHidden) {
            return window;
        }
    }
    return self.keyWindow;
}

@end
