//
//  UIFont+AKBasic.h
//  Pods
//
//  Created by 李翔宇 on 3/4/15.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const AKPingFangSCMediumFontType;//中黑
extern NSString * const AKPingFangSCRegularFontType;//常规

extern NSString * const AKPingFangSCSemiboldFontType;//中粗
extern NSString * const AKPingFangSCLightFontType;//细体

extern NSString * const AKDigitFontType;
extern NSString * const AKDigitFontBoldType;

#define AKPreferredBoldFont(_size) [UIFont ak_fontWithName:AKPingFangSCMediumFontType size:_size bold:YES]
#define AKPreferredFont(_size) [UIFont ak_fontWithName:AKPingFangSCRegularFontType size:_size bold:NO]

#define AKWideFont(_size) [UIFont ak_fontWithName:AKPingFangSCSemiboldFontType size:_size bold:YES]
#define AKThinFont(_size) [UIFont ak_fontWithName:AKPingFangSCLightFontType size:_size bold:NO]

#define AKFont(_fontName, _size, _bold) [UIFont ak_fontWithName:_fontName size:_size bold:_bold]

@interface UIFont (AKExtension)

/**
 *  获取指定字体
 *  请尽量使用此方法
 *
 *  @param name 字体
 *  @param size 字号
 *
 *  @return UIFont
 */
+ (UIFont *)ak_fontWithName:(NSString *)name size:(CGFloat)size bold:(BOOL)bold;
- (UIFont *)ak_italic;

@end

NS_ASSUME_NONNULL_END
