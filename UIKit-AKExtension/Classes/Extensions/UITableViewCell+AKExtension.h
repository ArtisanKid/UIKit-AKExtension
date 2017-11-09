//
//  UITableViewCell+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/5/26.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (AKExtension)

@property (nonatomic, assign) CGFloat ak_separatorInsetLeft;
@property (nonatomic, assign) CGFloat ak_separatorInsetRight;

@property (nonatomic, assign, getter=isAk_startSeparator) BOOL ak_startSeparator;
@property (nonatomic, strong, readonly) UIView *ak_separator;

@end

NS_ASSUME_NONNULL_END
