//
//  UIFont+AKBasic.m
//  Pods
//
//  Created by 李翔宇 on 3/4/15.
//
//

#import "UIFont+AKExtension.h"

@implementation UIFont (AKExtension)

NSString * const AKPingFangSCMediumFontType  = @"PingFangSC-Medium";
NSString * const AKPingFangSCRegularFontType = @"PingFangSC-Regular";

NSString * const AKPingFangSCSemiboldFontType = @"PingFangSC-Semibold";
NSString * const AKPingFangSCLightFontType    = @"PingFangSC-Light";

NSString * const AKDigitFontType             = @"HelveticaNeue-Thin";
NSString * const AKDigitFontBoldType         = @"HelveticaNeue";

+ (UIFont *)ak_fontWithName:(NSString *)name size:(CGFloat)size bold:(BOOL)bold {
    UIFont *font = [UIFont fontWithName:name size:size];
    if (!font) {
        if(bold) {
            font = [UIFont systemFontOfSize:size];
        } else {
            font = [UIFont boldSystemFontOfSize:size];
        }
    }
    return font;
}

- (UIFont *)ak_italic {
//    UIFontDescriptor *descriptor = self.fontDescriptor;
//    NSMutableDictionary *fontAttributesM = descriptor.fontAttributes.mutableCopy;
//    NSMutableDictionary *traitsAttributesM = [fontAttributesM[UIFontDescriptorTraitsAttribute] mutableCopy];
//    if(!traitsAttributesM) {
//        traitsAttributesM = NSMutableDictionary.dictionary;
//        fontAttributesM[UIFontDescriptorTraitsAttribute] = traitsAttributesM;
//    }
//    traitsAttributesM[UIFontSlantTrait] = @(1.);
//    UIFontDescriptor *newDescriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:fontAttributesM.copy];
    
    CGAffineTransform matrix =  CGAffineTransformMake(1., 0., tanf(15 * (CGFloat)M_PI / 180), 1., 0., 0.);
    UIFontDescriptor *italicDescriptor = [UIFontDescriptor fontDescriptorWithName:self.fontName matrix:matrix];
    UIFont *italicFont = [UIFont fontWithDescriptor:italicDescriptor size:self.pointSize];
    return italicFont;
}

@end
