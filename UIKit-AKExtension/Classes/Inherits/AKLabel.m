//
//  AKLabel.m
//  HowToPay
//
//  Created by 李翔宇 on 2017/10/20.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

#import "AKLabel.h"

@implementation AKLabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    if(UIEdgeInsetsEqualToEdgeInsets(self.ak_textEdgeInsets, UIEdgeInsetsZero)) {
        rect.size.width += (self.ak_textEdgeInsets.left + self.ak_textEdgeInsets.right);
        rect.size.height += (self.ak_textEdgeInsets.top + self.ak_textEdgeInsets.bottom);
    }
    return rect;
}

- (void)drawTextInRect:(CGRect)rect {
    if(!UIEdgeInsetsEqualToEdgeInsets(self.ak_textEdgeInsets, UIEdgeInsetsZero)) {
        rect.origin.x += self.ak_textEdgeInsets.left;
        rect.origin.y += self.ak_textEdgeInsets.top;
    }

    [super drawTextInRect:rect];
}

@end
