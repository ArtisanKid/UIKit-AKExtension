//
//  UIFont+AKBasic.m
//  Pods
//
//  Created by 李翔宇 on 3/4/15.
//
//

#import "UIFont+AKExtension.h"

UIFont * AKFont(NSString *familyName, NSString *fontName, CGFloat fontSize, UIFontWeight weight, BOOL isItalic, BOOL isBold, NSString *key) {
    NSMutableDictionary *attributesM = [NSMutableDictionary dictionary];
    if(familyName.length) {
        attributesM[UIFontDescriptorFamilyAttribute] = familyName;
    }
    
    if(fontName.length) {
        attributesM[UIFontDescriptorNameAttribute] = fontName;
    }
    
    if(fontSize) {
        attributesM[UIFontDescriptorSizeAttribute] = @(fontSize);
    }
    
    NSMutableDictionary *traitsM = [NSMutableDictionary dictionary];
    if(weight) {
        traitsM[UIFontWeightTrait] = @(weight);
    }
    attributesM[UIFontDescriptorTraitsAttribute] = [traitsM copy];
    
    UIFontDescriptorSymbolicTraits traits = 0;
    if(isItalic) {
        traits |= UIFontDescriptorTraitItalic;
    }
    if(isBold) {
        traits |= UIFontDescriptorTraitBold;
    }
    attributesM[UIFontSymbolicTrait] = @(traits);
    
    UIFontDescriptor *descriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:[attributesM copy]];
    UIFont *font = [UIFont fontWithDescriptor:descriptor size:fontSize];
    return font;
}

@implementation UIFont (AKExtension)

- (UIFont *)ak_italicFont {
    UIFontDescriptor *descriptor = [self.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitItalic];
    UIFont *font = [UIFont fontWithDescriptor:descriptor size:self.pointSize];
    return font;
}

- (UIFont *)ak_italicFontWithDegree:(CGFloat)degree {
    CGAffineTransform matrix =  CGAffineTransformMake(1., 0., tanf(degree * (CGFloat)M_PI / 180), 1., 0., 0.);
    UIFontDescriptor *descriptor = [self.fontDescriptor fontDescriptorWithMatrix:matrix];
    UIFont *font = [UIFont fontWithDescriptor:descriptor size:self.pointSize];
    return font;
}

- (UIFont *)ak_boldFont {
    UIFontDescriptor *descriptor = [self.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    UIFont *font = [UIFont fontWithDescriptor:descriptor size:self.pointSize];
    return font;
}

@end
