//
//  UINavigationItem+AKExtension.h
//  Pods
//
//  Created by 李翔宇 on 16/6/14.
//
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+AKExtension.h"

typedef NS_ENUM (NSUInteger, AKNavigationItemHandle) {
    AKNavigationItemHandleNull = 0,
    AKNavigationItemHandleSet = 1,/**<设置，清除以前的items*/
    AKNavigationItemHandleAdd /**<增加，不清除以前的items*/
};

typedef NS_ENUM (NSUInteger, AKNavigationItemPosition) {
    AKNavigationItemPositionNull = 0,
    AKNavigationItemPositionLeft = 1,
    AKNavigationItemPositionRight
};

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationItem (AKExtension)

- (void)ak_setBarButtonItem:(UIBarButtonItem *)item 
                    position:(AKNavigationItemPosition)position 
                      handle:(AKNavigationItemHandle)handle;

- (void)ak_setBarButtonItemBlock:(UIBarButtonItem * (^)())block 
                         position:(AKNavigationItemPosition)position 
                           handle:(AKNavigationItemHandle)handle;

/**
 *  清理最后一个item，最靠近中心的item
 *
 *  @param position AKBarButtonItemPosition
 */
- (void)ak_removeLastItemAtPosition:(AKNavigationItemPosition)position;

/**
 *  清理所有items
 *
 *  @param position AKBarButtonItemPosition
 */
- (void)ak_removeItemsAtPosition:(AKNavigationItemPosition)position;

@end

NS_ASSUME_NONNULL_END
