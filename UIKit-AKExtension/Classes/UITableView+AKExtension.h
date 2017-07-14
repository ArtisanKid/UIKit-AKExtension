//
//  UITableView+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/1/6.
//
//

#import <UIKit/UIKit.h>

#if 0 //DEBUG
#undef UITableView
#endif

//用于调试
@interface _AKTableView : UITableView @end

#if DEBUG
#define UITableView  _AKTableView
#endif

@interface UITableView (AKExtension)

/**
 是否隐藏列表多余的横线
 */
@property(nonatomic, assign, getter=isAk_hideExtraLine) BOOL ak_hideExtraLine;

/**
 带有回调的reloadData方法

 @param complete dispatch_block_t
 */
- (void)ak_reloadData:(dispatch_block_t)complete;

/**
 带有回调的reloadSections:withRowAnimation:方法

 @param sections NSIndexSet
 @param animation UITableViewRowAnimation
 @param complete dispatch_block_t
 */
- (void)ak_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation complete:(dispatch_block_t)complete;

/**
 group类型下，用于填充Header和Footer的View

 @return UIView
 */
- (UIView *)ak_nilViewForGroupStyle;

#pragma mark - 安全的TableView方法，防止数组越界

- (void)ak_scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)ak_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ak_selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
- (void)ak_deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

@end
