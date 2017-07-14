//
//  UIBarButtonItem+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/6/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, AKBarButtonItemType) {
    AKBarButtonItemTypeNull = 0,
    AKBarButtonItemTypePop = 1,
    AKBarButtonItemTypeClose,
    AKBarButtonItemTypePhone,
    AKBarButtonItemTypeIM,
    AKBarButtonItemTypeFavor,
    AKBarButtonItemTypeShare,
    AKBarButtonItemTypeLogin,
    AKBarButtonItemTypeRefresh,
    AKBarButtonItemTypeSearch,
};

NS_ASSUME_NONNULL_BEGIN

typedef void (^AKBarButtonItemAction)(UIBarButtonItem *sender);
typedef id _Nullable (^AKBarButtonItemContent)(UIControlState state);

@interface UIBarButtonItem (AKExtension)

@property (nonatomic, strong, readonly) UIButton *ak_button;

/**
 *  Block模式的类方法
 *  与BlocksKit不同，因为以下方法均会在内部生成UIButton
 *
 *  @param content  image(UIImage)/title(NSString)
 *  @param action   void (^)(UIBarButtonItem *sender)
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)ak_itemWithContent:(id)content action:(AKBarButtonItemAction)action;

/**
 *  创建UIBarButtonItem
 *
 *  @param states      UIControlState集合
 *  @param firstObject image(UIImage)/title(NSString)
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)ak_itemWithStates:(UIControlState)states content:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Block模式的类方法
 *  与BlocksKit不同，因为以下方法均会在内部生成UIButton
 *
 *  @param contentBlock id _Nullable (^)(UIControlState state)
 *  @param states       UIControlState集合
 *  @param action       void (^)(UIBarButtonItem * sender)
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)ak_itemWithContent:(AKBarButtonItemContent)contentBlock
                                 states:(UIControlState)states
                                 action:(AKBarButtonItemAction)action;

@end

NS_ASSUME_NONNULL_END
