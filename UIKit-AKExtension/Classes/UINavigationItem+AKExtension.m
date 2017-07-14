//
//  UINavigationItem+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/6/14.
//
//

#import "UINavigationItem+AKExtension.h"

CGFloat const AKFixedSpaceBarButtonItemWidth = -10.;

@implementation UINavigationItem (AKExtension)

- (void)ak_setBarButtonItem:(UIBarButtonItem *)item position:(AKNavigationItemPosition)position handle:(AKNavigationItemHandle)handle {
    if(!item) {
        return;
    }
    
    switch (handle) {
        case AKNavigationItemHandleSet: {
            UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            fixedSpaceBarButtonItem.width = AKFixedSpaceBarButtonItemWidth;
            
            switch (position) {
                case AKNavigationItemPositionLeft: {
                    self.leftBarButtonItems = @[fixedSpaceBarButtonItem, item];
                    break;
                }
                case AKNavigationItemPositionRight: {
                    self.rightBarButtonItems = @[fixedSpaceBarButtonItem, item];
                    break;
                }
                default: break;
            }
            break;
        }   
        case AKNavigationItemHandleAdd: {
            switch (position) {
                case AKNavigationItemPositionLeft: {
                    NSMutableArray *itemMArr = self.leftBarButtonItems.mutableCopy;
                    [itemMArr addObject:item];
                    self.leftBarButtonItems = itemMArr;
                    break;
                }
                case AKNavigationItemPositionRight: {
                    NSMutableArray *itemMArr = self.leftBarButtonItems.mutableCopy;
                    [itemMArr addObject:item];
                    self.rightBarButtonItems = itemMArr;
                    break;
                }   
                default: break;
            }
            break;
        }   
        default: break;
    }
}

- (void)ak_setBarButtonItemBlock:(UIBarButtonItem * (^)())block position:(AKNavigationItemPosition)position handle:(AKNavigationItemHandle)handle {
    [self ak_setBarButtonItem:block ? block() : nil  position:position handle:handle];
}

- (void)ak_removeLastItemAtPosition:(AKNavigationItemPosition)position {
    NSMutableArray <UIBarButtonItem *> *barButtonItemMArr = [NSMutableArray array];
    
    void (^removeItemFromBarButtonItemMArr)() = ^{
        [barButtonItemMArr removeLastObject];
        if (!barButtonItemMArr.count) {
            return;
        }
        if (barButtonItemMArr.lastObject.width == AKFixedSpaceBarButtonItemWidth) {
            [barButtonItemMArr removeLastObject];
        }
    };
    
    switch (position) {
        case AKNavigationItemPositionLeft: {
            if (self.leftBarButtonItems.count) {
                [barButtonItemMArr addObjectsFromArray:self.leftBarButtonItems];
            } else if (self.leftBarButtonItem) {
                [barButtonItemMArr addObject:self.leftBarButtonItem];
            }
            removeItemFromBarButtonItemMArr();
            self.leftBarButtonItems = barButtonItemMArr;
            break;
        }
        case AKNavigationItemPositionRight: {
            if (self.rightBarButtonItems.count) {
                [barButtonItemMArr addObjectsFromArray:self.rightBarButtonItems];
            } else if (self.rightBarButtonItem) {
                [barButtonItemMArr addObject:self.rightBarButtonItem];
            }
            removeItemFromBarButtonItemMArr();
            self.rightBarButtonItems = barButtonItemMArr;
            break;
        }
        default: break;
    }
}

- (void)ak_removeItemsAtPosition:(AKNavigationItemPosition)position {
    switch (position) {
        case AKNavigationItemPositionLeft: {
            self.leftBarButtonItem = nil;
            self.leftBarButtonItems = nil;
            break;
        }
        case AKNavigationItemPositionRight: {
            self.rightBarButtonItem = nil;
            self.rightBarButtonItems = nil;
            break;
        }
        default: break;
    }
}

@end
