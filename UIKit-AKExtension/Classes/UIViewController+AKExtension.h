//
//  UIViewController+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/6/14.
//
//

#import <UIKit/UIKit.h>
#import "UINavigationItem+AKExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (AKExtension)

/**
 *  添加文字按钮，向中心添加新item
 *
 *  @param content NSString/UIImage
 *
 *  @return 添加的item
 */
- (nullable UIBarButtonItem *)ak_addBarButtonItemWithContent:(id)content
                                                       action:(void (^)(UIBarButtonItem *sender))action
                                                     position:(AKNavigationItemPosition)position
                                                       handle:(AKNavigationItemHandle)handle;

/**
 *  显示一个红色的badge
 *  与系统TabBarItem的badgeValue不冲突
 */
@property (nonatomic, assign) BOOL ak_showBadge;

@end

NS_ASSUME_NONNULL_END
