//
//  UIKit-AKConfig.h
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/10/26.
//

#import <UIKit/UIKit.h>

#pragma mark - 内容与控制器的间距

UIKIT_EXTERN UIEdgeInsets UIViewController_AKContentMargin;

/**
 配置内容与控制器的边距
 
 @param margin 边距
 */
UIKIT_EXTERN void UIViewControllerSetContentMargin(UIEdgeInsets margin);

/**
 获取内容与控制器的上边距配置
 
 @return 上边距
 */
#define UIViewController_AKContentMargin_Top UIViewController_AKContentMargin.top

/**
 获取内容与控制器的左边距配置
 
 @return 左边距
 */
#define UIViewController_AKContentMargin_Left UIViewController_AKContentMargin.left

/**
 获取内容与控制器的下边距配置
 
 @return 下边距
 */
#define UIViewController_AKContentMargin_Bottom UIViewController_AKContentMargin.bottom

/**
 获取内容与控制器的左边距配置
 
 @return 右边距
 */
#define UIViewController_AKContentMargin_Right UIViewController_AKContentMargin.right

#pragma mark - 内容与cell的边距

UIKIT_EXTERN UIEdgeInsets UITableViewCell_AKContentMargin;

/**
 配置内容与cell的边距

 @param margin 边距
 */
UIKIT_EXTERN void UITableViewCellSetContentMargin(UIEdgeInsets margin);

/**
 获取内容与cell的上边距配置

 @return 上边距
 */
#define UITableViewCell_AKContentMargin_Top UITableViewCell_AKContentMargin.top

/**
 获取内容与cell的左边距配置
 
 @return 左边距
 */
#define UITableViewCell_AKContentMargin_Left UITableViewCell_AKContentMargin.left

/**
 获取内容与cell的下边距配置
 
 @return 下边距
 */
#define UITableViewCell_AKContentMargin_Bottom UITableViewCell_AKContentMargin.bottom

/**
 获取内容与cell的右边距配置
 
 @return 右边距
 */
#define UITableViewCell_AKContentMargin_Right UITableViewCell_AKContentMargin.right

#pragma mark - 内容与内容的间距

UIKIT_EXTERN UIOffset UIView_AKContentSpace;

/**
 配置内容与内容的间距
 
 @param space 间距
 */
void UIViewSetContentSpace(UIOffset space);

/**
 获取内容与内容的横向间距配置

 @return 横向间距
 */
#define UIView_AKContentSpace_Horizontal UIView_AKContentSpace.horizontal

/**
 获取内容与内容的竖向间距配置
 
 @return 竖向间距
 */
#define UIView_AKContentSpace_Vertical UIView_AKContentSpace.vertical

@interface UIKit_AKConfig : NSObject

@end
