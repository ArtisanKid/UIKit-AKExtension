//
//  AKTextField.m
//  HowToPay
//
//  Created by 李翔宇 on 2017/10/10.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

#import "AKTextField.h"

@implementation AKTextField

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    if(!CGRectEqualToRect(self.ak_placeholderRect, CGRectNull)
       && !CGRectEqualToRect(self.ak_placeholderRect, CGRectZero)) {
        return self.ak_placeholderRect;
    } else if(self.ak_placeholderFont) {
        NSDictionary *attributedDic = @{ NSFontAttributeName : self.ak_placeholderFont };
        CGSize size = [self.placeholder sizeWithAttributes:attributedDic];
        return CGRectMake(0., (CGRectGetHeight(bounds) - size.height) / 2., size.width, size.height);
    } else {
        return [super placeholderRectForBounds:bounds];
    }
}

- (void)drawPlaceholderInRect:(CGRect)rect {    
    if(self.ak_placeholderFont
       || self.ak_placeholderColor) {
        if(!self.ak_placeholderFont) {
            self.ak_placeholderFont = [UIFont systemFontOfSize:16.];
        }
        
        if(!self.ak_placeholderColor) {
            self.ak_placeholderColor = [UIColor colorWithRed:153. / 225. green:153. / 225. blue:153. / 225. alpha:1.];
        }
        
        NSDictionary *attributedDic = @{ NSFontAttributeName : self.ak_placeholderFont,
                                         NSForegroundColorAttributeName : self.ak_placeholderColor };
        [self.placeholder drawInRect:rect withAttributes:attributedDic];
    } else {
        [super drawPlaceholderInRect:rect];
    }
}

@end
