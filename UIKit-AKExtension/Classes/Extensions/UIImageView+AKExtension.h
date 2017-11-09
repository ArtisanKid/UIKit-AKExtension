//
//  UIImageView+AKRewrite.h
//  Pods
//
//  Created by 李翔宇 on 15/8/7.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (AKExtension)

/**
 *  用于支持UIScrollView的横向和纵向滚动条永远显示
 */
@property(nonatomic, assign) BOOL ak_alwayShowInScrollView;

@end

NS_ASSUME_NONNULL_END
