//
//  UIKit-AKAdapter.m
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/25.
//

#import "UIKit-AKAdapter.h"

CGFloat const AK_iPhone7_UI_Width = 375.;
inline CGFloat AK_iPhone7_UI_Adapt(CGFloat value) {
    static CGFloat scale = 0.;
    scale = AK_Screen_Width / AK_iPhone7_UI_Width;
    return value * scale;
}

CGFloat const AK_iPhone7P_UI_Width = 414.;
inline CGFloat AK_iPhone7P_UI_Adapt(CGFloat value) {
    static CGFloat scale = 0.;
    scale = AK_Screen_Width / AK_iPhone7P_UI_Width;
    return value * scale;
}

inline CGRect AKBounds(CGFloat width, CGFloat height) {
    return CGRectMake(0.f, 0.f, width, height);
}

inline UIEdgeInsets AKEdgeInset(CGFloat inset) {
    return UIEdgeInsetsMake(inset, inset, inset, inset);
}

inline UIEdgeInsets AKEdgeInsets(CGFloat vertical, CGFloat horizontal) {
    return UIEdgeInsetsMake(vertical, horizontal, vertical, horizontal);
}

@implementation UIKit_AKAdapter

@end
