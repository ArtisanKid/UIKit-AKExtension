//
//  UIView-AKProtocol.h
//  Pods
//
//  Created by 李翔宇 on 15/7/7.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UIView_AKProtocol <NSObject>

@optional

/**
 使用object来绘制UIView
 
 @param object view对应类型对象
 */
- (void)AKDrawContent:(id)object;

/**
 计算UIView在指定对象下的大小
 
 @param object view对应类型对象
 @return view在object下的大小
 */
+ (CGSize)AKSizeWithContent:(id)object;

/**
 UIView最小大小，与内容无关
 
 @return 最小大小
 */
+ (CGSize)AKMinimumSize;

@end

NS_ASSUME_NONNULL_END
