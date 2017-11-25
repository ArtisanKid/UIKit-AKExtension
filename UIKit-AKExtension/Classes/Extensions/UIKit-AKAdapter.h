//
//  UIKit-AKAdapter.h
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/25.
//

#import <Foundation/Foundation.h>

#pragma mark- 常量

#define AK_Screen_Size    CGRectGetSize(UIScreen.mainScreen.bounds)
#define AK_Screen_Width   CGRectGetWidth(UIScreen.mainScreen.bounds)
#define AK_Screen_Height  CGRectGetHeight(UIScreen.mainScreen.bounds)

#define AKMainWindow    UIApplication.sharedApplication.delegate.window
#define AKKeyWindow     UIApplication.sharedApplication.keyWindow

#pragma mark- UI缩放模式

//iOS中宽高都是以point来表示的，工程师看到关注的都是逻辑宽度
//iPhone4~iPhone4s             屏幕逻辑尺寸：320 * 480 像素尺寸：640 * 960   UI尺寸：640 * 960
//iPhone5~iPhone5s             屏幕逻辑尺寸：320 * 568 像素尺寸：640 * 1136  UI尺寸：640 * 1136
//iPhone6,iPhone6s,iPhone7     屏幕逻辑尺寸：375 * 667 像素尺寸：750 * 1334  UI尺寸：750 * 1334
//iPhone6P,iPhone6sP,iPhone7P  屏幕逻辑尺寸：414 * 736 像素尺寸：1080 * 1920 UI尺寸：1242 * 2208

//非Plus系列的iPhone，UI尺寸与逻辑尺寸都是2:1；Plus系列的iPhone，UI尺寸与逻辑尺寸都是3:1
//非Plus系列的iPhone，UI尺寸与像素尺寸相同；Plus系列的iPhone，UI尺寸大于像素尺寸，也就是一个point中，其实并没有三个像素点，UI会经过运算，将三个像素有损的显示在两个多像素点上

UIKIT_EXTERN CGFloat const AK_iPhone7_UI_Width;
UIKIT_EXTERN CGFloat AK_iPhone7_UI_Adapt(CGFloat value);

UIKIT_EXTERN CGFloat const AK_iPhone7P_UI_Width;
UIKIT_EXTERN CGFloat AK_iPhone7P_UI_Adapt(CGFloat value);

#pragma mark- 简化控制

UIKIT_EXTERN CGRect AKBounds(CGFloat width, CGFloat height);
UIKIT_EXTERN UIEdgeInsets AKEdgeInset(CGFloat inset);
UIKIT_EXTERN UIEdgeInsets AKEdgeInsets(CGFloat vertical, CGFloat horizontal);

@interface UIKit_AKAdapter : NSObject

@end
