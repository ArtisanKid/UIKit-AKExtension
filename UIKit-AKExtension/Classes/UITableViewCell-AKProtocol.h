//
//  UITableViewCell-AKProtocol.h
//  Pods
//
//  Created by 李翔宇 on 2017/7/14.
//
//

#import <Foundation/Foundation.h>
#import "UIView-AKProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UITableViewCell_AKProtocol <UIView_AKProtocol>

@optional

/**
 计算UITableViewCell在指定对象下的高度
 
 @param content cell对应类型对象
 @return cell在object下的高度
 */
+ (CGFloat)AKHeightWithContent:(id)content;

/**
 UITableViewCell最小高度，与内容无关
 
 @return 最小高度
 */
+ (CGFloat)AKMinimumHeight;

@end

NS_ASSUME_NONNULL_END
