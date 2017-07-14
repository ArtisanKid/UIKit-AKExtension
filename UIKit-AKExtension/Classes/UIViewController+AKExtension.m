//
//  UIViewController+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/6/14.
//
//

#import "UIViewController+AKExtension.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>

#pragma mark- UIView (AKBadge)

static const void * const UIViewBadgeKey = &UIViewBadgeKey;

@interface UIView (AKBadge)

@property (nonatomic, strong) UIView *ak_badge;

@end

@implementation UIView (AKBadge)

@dynamic ak_badge;

- (void)setAk_badge:(UIView *)badge {
    objc_setAssociatedObject(self, UIViewBadgeKey, badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)AKTabBarItemBadgeView {
    return objc_getAssociatedObject(self, UIViewBadgeKey);
}

@end

#pragma mark- UIViewController (AKExtension)

static const void * const UIViewControllerShowBadgeKey = &UIViewControllerShowBadgeKey;

@implementation UIViewController (AKExtension)

- (nullable UIBarButtonItem *)ak_addBarButtonItemWithContent:(id)content
                                                       action:(void (^)(UIBarButtonItem *sender))action
                                                     position:(AKNavigationItemPosition)position
                                                       handle:(AKNavigationItemHandle)handle {
    if (!self.navigationItem) {
        return nil;
    }
    
    UIBarButtonItem *item = [UIBarButtonItem ak_itemWithContent:content action:action];
    [self.navigationItem ak_setBarButtonItem:item position:position handle:handle];
    return item;
}

@dynamic ak_showBadge;

- (void)setAk_showBadge:(BOOL)show {
    objc_setAssociatedObject(self, UIViewControllerShowBadgeKey, @(show), OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self tabBarBadgeVisible:show];
}

- (BOOL)ak_showBadge {
    return [objc_getAssociatedObject(self, UIViewControllerShowBadgeKey) boolValue];
}

- (void)tabBarBadgeVisible:(BOOL)visible {
    UITabBarController *tabBarController = self.tabBarController;
    if (!tabBarController) {
        return;
    }
    
    UIView *tabBarItemView = nil;
    NSArray *tabBarControllers = self.tabBarController.viewControllers;
    if (self.navigationController) {
        //controller->navigationController->TabBarController
        if ([tabBarControllers containsObject:self.navigationController]) {
            tabBarItemView = [self.navigationController.tabBarItem valueForKey:@"_view"];
        }
    } else {
        //controller->TabBarController
        if ([tabBarControllers containsObject:self]) {
            tabBarItemView = [self.tabBarItem valueForKey:@"_view"];
        }
    }
    
    if (!tabBarItemView) {
        return;
    }
    
    if (!tabBarItemView.ak_badge && visible) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColor.redColor;
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 4.;
        [tabBarItemView addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(8.);
            make.height.mas_equalTo(8.);
            make.top.mas_equalTo(0.);
            make.trailing.mas_equalTo(0.);
        }];
        
        tabBarItemView.ak_badge = view;
    }
    
    tabBarItemView.AKTabBarItemBadgeView.hidden = !visible;
}

@end
