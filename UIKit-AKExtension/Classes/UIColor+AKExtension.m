//
//  UIColor+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 15/12/23.
//  
//

#import "UIColor+AKExtension.h"
#import "UIImage+AKExtension.h"

UIColor * AKColorRGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    return [UIColor ak_colorWithRed: red green: green blue: blue alpha: alpha];
}

UIColor * AKColorRGB(CGFloat red, CGFloat green, CGFloat blue) {
    return [UIColor ak_colorWithRed: red green: green blue: blue];
}

extern UIColor * AKColorVA(CGFloat value, CGFloat alpha) {
    return [UIColor ak_colorWithRed: value green: value blue: value alpha: alpha];
}

extern UIColor * AKColorV(CGFloat value) {
    return [UIColor ak_colorWithRed: value green: value blue: value];
}

extern UIColor * AKColorHexA(NSString *hex, CGFloat alpha) {
    return [UIColor ak_colorWithHex:hex alpha:alpha];
}

extern UIColor * AKColorHex(NSString *hex) {
    return [UIColor ak_colorWithHex:hex];
}

extern UIColor * AKColorBlackA(CGFloat alpha) {
    return [[UIColor blackColor] colorWithAlphaComponent:alpha];
}

extern UIColor * AKColorWhiteA(CGFloat alpha) {
    return [[UIColor whiteColor] colorWithAlphaComponent:alpha];
}

@implementation UIColor (AKExtension)

+ (UIColor *)ak_colorWithRGB:(CGFloat)red :(CGFloat)green :(CGFloat)blue {
    return [UIColor ak_colorWithRed:red green:green blue:blue];
}

+ (UIColor *)ak_colorWithRGBA:(CGFloat)red :(CGFloat)green :(CGFloat)blue :(CGFloat)alpha {
    return [UIColor ak_colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)ak_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor ak_colorWithRed:red green:green blue:blue alpha:1.];
}

+ (UIColor *)ak_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255. green:green / 255. blue:blue / 255. alpha:alpha];
}

+ (UIColor *)ak_colorWithHex:(NSString *)hex {
    return [self ak_colorWithHex:hex alpha:1.];
}

+ (UIColor *)ak_colorWithHex:(NSString *)hex alpha:(CGFloat)alpha {
    unsigned int c;
    if ([hex hasPrefix:@"#"]) {
        if (hex.length != 7) {
            return [UIColor blackColor];
        }
        [[NSScanner scannerWithString:[hex substringFromIndex:1]] scanHexInt:&c];
    } else {
        if (hex.length != 6) {
            return [UIColor blackColor];
        }
        [[NSScanner scannerWithString:hex] scanHexInt:&c];
    }
    int r = (c >> 16) & 0xFF;
    int g = (c >> 8) & 0xFF;
    int b = (c) & 0xFF;
    
    return [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:alpha];
}

- (BOOL)isAk_lightColor {
    CGFloat hue, saturation, brightness, alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    CGFloat lightness = (2. - saturation) * brightness / 2.;
    
    return lightness >= .5;
}

- (UIColor *)ak_reverseColor {
    CGFloat red = 0.;
    CGFloat green = 0.;
    CGFloat blue = 0.;
    CGFloat alpha = 0.;
    if(![self getRed:&red green:&green blue:&blue alpha:&alpha]) {
        return nil;
    }
    return [UIColor colorWithRed:1.-red green:1.-green blue:1.-blue alpha:alpha];
}

- (UIImage *)ak_image {
    return [UIImage ak_imageWithColor:self];
}

@end
