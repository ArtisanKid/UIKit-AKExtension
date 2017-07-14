//
//  UIImage+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 15/12/23.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (AKExtension)

@property (nonatomic, assign, readonly) CGFloat ak_width;
@property (nonatomic, assign, readonly) CGFloat ak_height;

#pragma mark - Draw image with color
/*!
 * 可拉伸的纯色图片。拉伸点在(1,1)点位置，无需关注拉伸点
 */
+ (UIImage *)ak_imageWithColor:(UIColor *)color;

//不可拉伸纯色图片
+ (UIImage *)ak_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
