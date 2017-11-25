//
//  AKLabel.m
//  HowToPay
//
//  Created by 李翔宇 on 2017/10/20.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

#import "AKLabel.h"

@implementation AKLabel

// override points. can adjust rect before calling super.
// label has default content mode of UIViewContentModeRedraw

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    if(!UIEdgeInsetsEqualToEdgeInsets(self.ak_textEdgeInsets, UIEdgeInsetsZero)) {
        CGFloat dx = self.ak_textEdgeInsets.left + self.ak_textEdgeInsets.right;
        CGFloat dy = self.ak_textEdgeInsets.top + self.ak_textEdgeInsets.bottom;
        return CGRectInset(bounds, dx, dy);
    } else if(CGRectEqualToRect(self.ak_textRectForBounds, CGRectZero)) {
        return self.ak_textRectForBounds;
    }
    return rect;
}

- (void)drawTextInRect:(CGRect)rect {
    if(!UIEdgeInsetsEqualToEdgeInsets(self.ak_textEdgeInsets, UIEdgeInsetsZero)) {
        rect.origin.x += self.ak_textEdgeInsets.left;
        rect.origin.y += self.ak_textEdgeInsets.top;
    } else if(CGRectEqualToRect(self.ak_drawTextInRect, CGRectZero)) {
        rect = self.ak_drawTextInRect;
    }
    [super drawTextInRect:rect];
}

@end
