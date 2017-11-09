//
//  UICollectionView+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/4/7.
//
//

#import "UICollectionView+AKExtension.h"
#import "UIKit-AKExtensionMacros.h"

@implementation UICollectionView (AKExtension)

- (void)ak_reloadData:(dispatch_block_t)complete {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            !complete ? : complete();
        });
    });
}

- (void)ak_scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated {
    if(indexPath.section >= self.numberOfSections) {
        UIKit_AKExtensionLog(@"数组越界，numberOfSections：%@ section：%@", @(self.numberOfSections), @(indexPath.section));
        return;
    }
    
    NSUInteger itemCount = [self numberOfItemsInSection:indexPath.section];
    if(indexPath.item >= itemCount) {
        UIKit_AKExtensionLog(@"数组越界，numberOfItemsInSection：%@ row：%@", @(itemCount), @(indexPath.item));
        return;
    }
    
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

@end
