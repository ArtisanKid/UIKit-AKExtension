//
//  UICollectionView+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/4/7.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (AKExtension)

/**
 带有回调的reloadData方法

 @param complete dispatch_block_t
 */
- (void)ak_reloadData:(dispatch_block_t)complete;

/**
 安全的滚动方法，防止数组越界
 同scrollToItemAtIndexPath:atScrollPosition:animated:

 @param indexPath NSIndexPath
 @param scrollPosition UICollectionViewScrollPosition
 @param animated BOOL
 */
- (void)ak_scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
