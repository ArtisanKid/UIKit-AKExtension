//
//  UINavigationController+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/2/29.
//
//

#import "UINavigationController+AKExtension.h"

@implementation UINavigationController (AKExtension)

- (void)ak_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (!viewController) {
        return;
    }
    if (![self.topViewController isKindOfClass:viewController.class]) {
        [self pushViewController:viewController animated:animated];
    }
}

- (nullable UIViewController *)ak_popViewControllerAnimated:(BOOL)animated {
    return [self ak_popViewControllerAnimated:animated completion:^{}];
}

- (nullable UIViewController *)ak_popViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion {
    UIViewController *controller = nil;
    if (self.viewControllers.count > 1) {
        controller = [self popViewControllerAnimated:animated];
    } else if (self.presentingViewController) {
        [self.presentingViewController dismissViewControllerAnimated:animated completion:completion];
    } else if (self.parentViewController) {
        [self removeFromParentViewController];
        [self.view removeFromSuperview];
    }
    return controller;
}

- (nullable NSArray<UIViewController *> *)ak_popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (!viewController) {
        return nil;
    }
    if([self.topViewController isMemberOfClass:viewController.class]) {
        return nil;
    }
    return [self popToViewController:viewController animated:animated];
}

- (nullable NSArray<UIViewController *> *)ak_popToViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated {
    if (!viewControllerName) {
        return nil;
    }
    
    if (!NSClassFromString(viewControllerName)) {
        return nil;
    }
    
    if([self.topViewController isMemberOfClass:NSClassFromString(viewControllerName)]) {
        return nil;
    }
    
    for (UIViewController *viewController in self.viewControllers) {
        if ([NSStringFromClass(viewController.class) isEqualToString:viewControllerName]) {
            return [self popToViewController:viewController animated:animated];
            break;
        }
    }
    
    return nil;
}

@end
