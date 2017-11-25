//
//  UIKit-AKConfig.m
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/10/26.
//

#import "UIKit-AKConfig.h"

#pragma mark - 内容与控制器的间距

UIEdgeInsets UIViewController_AKContentMargin = {0., 0., 0., 0.};

void UIViewControllerSetContentMargin(UIEdgeInsets margin) {
    UIViewController_AKContentMargin = margin;
}

#pragma mark - 内容与cell的边距

UIEdgeInsets UITableViewCell_AKContentMargin = {0., 0., 0., 0.};

void UITableViewCellSetContentMargin(UIEdgeInsets margin) {
    UITableViewCell_AKContentMargin = margin;
}

#pragma mark - 内容与内容的间距

UIOffset UIView_AKContentSpace = {0., 0.};

void UIViewSetContentSpace(UIOffset space) {
    UIView_AKContentSpace = space;
}

@implementation UIKit_AKConfig

@end
