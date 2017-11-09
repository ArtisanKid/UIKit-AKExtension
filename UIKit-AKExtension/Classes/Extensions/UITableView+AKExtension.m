//
//  UITableView+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/1/6.
//
//

#import "UITableView+AKExtension.h"
#import "UIKit-AKExtensionMacros.h"
#import <objc/runtime.h>

#pragma mark- _AKTableView
@implementation _AKTableView

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    @try {
        [super layoutSublayersOfLayer:layer];
    } @catch (NSException *exception) {
    } @finally {
    }
}

@end

#pragma mark- UITableView (AKExtension)
static const void * const UITableViewHideExtraLineKey = &UITableViewHideExtraLineKey;

@implementation UITableView (AKExtension)

@dynamic ak_hideExtraLine;

- (BOOL)isAk_hideExtraLine {
    return [objc_getAssociatedObject(self, UITableViewHideExtraLineKey) boolValue];
}

- (void)setAk_hideExtraLine:(BOOL)hide {
    if([objc_getAssociatedObject(self, UITableViewHideExtraLineKey) boolValue] == hide) {
        return;
    }
    
    objc_setAssociatedObject(self, UITableViewHideExtraLineKey, @(hide), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if(hide) {
        //使用tableFooterView来去掉多余横线
        self.tableFooterView = UIView.new;
    } else {
        self.tableFooterView = nil;
    }
}

- (void)ak_reloadData:(dispatch_block_t)complete {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            !complete ? : complete();
        });
    });
}

- (void)ak_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation complete:(dispatch_block_t)complete {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadSections:sections withRowAnimation:animation];
        dispatch_async(dispatch_get_main_queue(), ^{
            !complete ? : complete();
        });
    });
}

- (UIView *)ak_nilViewForGroupStyle {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0., 0., 0., CGFLOAT_MIN)];
    return view;
}

- (void)ak_scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated {
    if(indexPath.section >= self.numberOfSections) {
        UIKit_AKExtensionLog(@"数组越界，numberOfSections：%@ section：%@", @(self.numberOfSections), @(indexPath.section));
        NSAssert(0, @"UITableView选择section越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    NSUInteger rowCount = [self numberOfRowsInSection:indexPath.section];
    if(indexPath.row >= rowCount) {
        UIKit_AKExtensionLog(@"数组越界，numberOfRowsInSection：%@ row：%@", @(rowCount), @(indexPath.row));
        NSAssert(0, @"UITableView选择row越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)ak_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    __block BOOL canExecute = YES;
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
        if(indexPath.section >= self.numberOfSections) {
            UIKit_AKExtensionLog(@"数组越界，sections：%@ section：%@", @(self.numberOfSections), @(indexPath.section));
            NSAssert(0, @"UITableView选择section越界，最好能够确定一下线程执行顺序");
            canExecute = NO;
            *stop = YES;
        }
        
        NSUInteger rowCount = [self numberOfRowsInSection:indexPath.section];
        if(indexPath.row >= rowCount) {
            UIKit_AKExtensionLog(@"数组越界，rows：%@ row：%@", @(rowCount), @(indexPath.row));
            NSAssert(0, @"UITableView选择row越界，最好能够确定一下线程执行顺序");
            canExecute = NO;
            *stop = YES;
        }
    }];
    
    if(!canExecute) {
        return;
    }
    
    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)ak_selectRowAtIndexPath:(nullable NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition {
    if(indexPath.section >= self.numberOfSections) {
        UIKit_AKExtensionLog(@"数组越界，sections：%@ section：%@", @(self.numberOfSections), @(indexPath.section));
        NSAssert(0, @"UITableView选择section越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    NSUInteger rowCount = [self numberOfRowsInSection:indexPath.section];
    if(indexPath.row >= rowCount) {
        UIKit_AKExtensionLog(@"数组越界，rows：%@ row：%@", @(rowCount), @(indexPath.row));
        NSAssert(0, @"UITableView选择row越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    [self selectRowAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}
- (void)ak_deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated {
    if(indexPath.section >= self.numberOfSections) {
        UIKit_AKExtensionLog(@"数组越界，sections：%@ section：%@", @(self.numberOfSections), @(indexPath.section));
        NSAssert(0, @"UITableView选择section越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    NSUInteger rowCount = [self numberOfRowsInSection:indexPath.section];
    if(indexPath.row >= rowCount) {
        UIKit_AKExtensionLog(@"数组越界，rows：%@ row：%@", @(rowCount), @(indexPath.row));
        NSAssert(0, @"UITableView选择row越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    [self deselectRowAtIndexPath:indexPath animated:animated];
}

@end
