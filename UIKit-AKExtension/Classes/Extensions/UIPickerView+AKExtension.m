//
//  UIPickerView+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/6/3.
//
//

#import "UIPickerView+AKExtension.h"
#import "UIKit-AKMacros.h"

@implementation UIPickerView (AKExtension)

- (void)ak_reloadAllComponents:(dispatch_block_t)complete {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadAllComponents];
        dispatch_async(dispatch_get_main_queue(), ^{
            !complete ? : complete();
        });
    });
}

- (void)ak_reloadComponent:(NSUInteger)component complete:(dispatch_block_t)complete {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadComponent:component];
        dispatch_async(dispatch_get_main_queue(), ^{
            !complete ? : complete();
        });
    });
}

- (void)ak_selectRow:(NSUInteger)row inComponent:(NSUInteger)component animated:(BOOL)animated {
    if(component >= self.numberOfComponents) {
        UIKit_AKLog(@"数组越界，components：%@ component：%@", @(self.numberOfComponents), @(component));
        NSAssert(0, @"UIPickerView选择component越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    NSUInteger rowCount = [self numberOfRowsInComponent:component];
    if(row >= rowCount) {
        UIKit_AKLog(@"数组越界，rows：%@ row：%@", @(rowCount), @(row));
        NSAssert(0, @"UIPickerView选择row越界，最好能够确定一下线程执行顺序");
        return;
    }
    
    [self selectRow:row inComponent:component animated:animated];
}

@end
