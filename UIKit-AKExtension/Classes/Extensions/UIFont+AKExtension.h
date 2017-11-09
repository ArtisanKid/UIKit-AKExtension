//
//  UIFont+AKBasic.h
//  Pods
//
//  Created by 李翔宇 on 3/4/15.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define AKPreferredFont(_style)            [UIFont preferredFontForTextStyle:_style]
#define AKSystemFont(_size)                [UIFont systemFontOfSize:_size]
#define AKBoldSystemFont(_size)            [UIFont boldSystemFontOfSize:_size]

UIKIT_EXTERN UIFont * AKFont(NSString *familyName, NSString *fontName, CGFloat fontSize, UIFontWeight weight, BOOL isItalic, BOOL isBold, NSString *key);

@interface UIFont (AKExtension)

/**
 如果当前字体并不支持斜体，此属性可能无效
 */
@property(nonatomic, strong, readonly) UIFont *ak_italicFont;

/**
 指定倾斜度数

 @param degree 倾斜度数
 @return 新的字体
 */
- (UIFont *)ak_italicFontWithDegree:(CGFloat)degree;

/**
 如果当前字体并不支持斜体，此属性可能无效
 */
@property(nonatomic, strong, readonly) UIFont *ak_boldFont;

@end

NS_ASSUME_NONNULL_END
