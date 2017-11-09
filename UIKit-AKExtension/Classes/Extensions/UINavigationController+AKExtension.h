//
//  UINavigationController+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/2/29.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (AKExtension)

/**
 *  同pushViewController: animated:
 *  防止了因为UI刷新率低造成的重复推进相同页面
 *
 *  @param viewController UIViewController
 *  @param animated       animated
 */
- (void)ak_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (nullable UIViewController *)ak_popViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;

/**
 *  同popViewControllerAnimated:
 *  扩展了pop的能力
 *
 *  @param animated animated
 *
 *  @return UIViewController
 */
- (nullable UIViewController *)ak_popViewControllerAnimated:(BOOL)animated;


/**
 *  同popToViewController: animated:
 *  防止了因为UI刷新率低造成的重复回退页面
 *
 *  @param viewController 指定回退到的UIViewController对象
 *  @param animated       animated
 *
 *  @return NSArray<UIViewController *>
 */
- (nullable NSArray<UIViewController *> *)ak_popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 *  同popToViewController: animated:
 *  防止了因为UI刷新率低造成的重复回退页面
 *  同时，简化了需要持有viewController对象的要求
 *
 *  @param viewControllerName 指定回退到的UIViewController类名
 *  @param animated           animated
 *
 *  @return NSArray<UIViewController *>
 */
- (nullable NSArray<UIViewController *> *)ak_popToViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
