//
//  UIImage+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 15/12/23.
//
//

#import "UIImage+AKExtension.h"

@implementation UIImage (AKExtension)
- (CGFloat)ak_width {
    return self.size.width;
}

- (CGFloat)ak_height {
    return self.size.height;
}

+ (UIImage *)ak_imageWithColor:(UIColor *)color {
    UIImage *image = [self ak_imageWithColor:color size:CGSizeMake(3., 3.)];
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(1., 1., 1., 1.)];
}

+ (UIImage *)ak_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0., 0., size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
