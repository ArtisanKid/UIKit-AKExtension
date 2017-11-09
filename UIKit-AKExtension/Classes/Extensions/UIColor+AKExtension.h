//
//  UIColor+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 15/12/23.
//
//

#import <UIKit/UIKit.h>

//快捷颜色
extern UIColor * AKColorRGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);
extern UIColor * AKColorRGB(CGFloat red, CGFloat green, CGFloat blue);
extern UIColor * AKColorVA(CGFloat value, CGFloat alpha);
extern UIColor * AKColorV(CGFloat value);

extern UIColor * AKColorHexA(NSString *hex, CGFloat alpha);
extern UIColor * AKColorHex(NSString *hex);

extern UIColor * AKColorBlackA(CGFloat alpha);
extern UIColor * AKColorWhiteA(CGFloat alpha);

@interface UIColor (AKExtension)

+ (UIColor *)ak_colorWithRGB:(CGFloat)red :(CGFloat)green :(CGFloat)blue;
+ (UIColor *)ak_colorWithRGBA:(CGFloat)red :(CGFloat)green :(CGFloat)blue :(CGFloat)alpha;

+ (UIColor *)ak_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)ak_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)ak_colorWithHex:(NSString *)hex;
+ (UIColor *)ak_colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;

@property (nonatomic, assign, readonly, getter=isAk_lightColor) BOOL ak_lightColor;
@property (nonatomic, strong, readonly) UIColor *ak_reverseColor;
@property (nonatomic, strong, readonly) UIImage *ak_image;

@end
