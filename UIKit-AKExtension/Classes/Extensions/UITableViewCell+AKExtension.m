//
//  UITableViewCell+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/5/26.
//
//

#import "UITableViewCell+AKExtension.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>
#import "UIColor+AKExtension.h"

static const void * const UITableViewCellSeparatorKey = &UITableViewCellSeparatorKey;

@implementation UITableViewCell (AKExtension)

@dynamic ak_separatorInsetLeft;
@dynamic ak_separatorInsetRight;
@dynamic ak_startSeparator;

- (CGFloat)ak_separatorInsetLeft {
    return self.separatorInset.left;
}

- (void)setAk_separatorInsetLeft:(CGFloat)left {
    if(self.isAk_startSeparator) {
        [self.ak_separator mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(.7f);
            make.bottom.mas_equalTo(0.);
            make.leading.mas_equalTo(self.separatorInset.left);
            make.trailing.mas_equalTo(self.separatorInset.right);
        }];
    } else {
        self.preservesSuperviewLayoutMargins = NO;
        self.layoutMargins = UIEdgeInsetsZero;
        self.separatorInset = UIEdgeInsetsMake(self.separatorInset.top, left, self.separatorInset.bottom, self.separatorInset.right);
    }
}

- (CGFloat)ak_separatorInsetRight {
    return self.separatorInset.right;
}

- (void)setAk_separatorInsetRight:(CGFloat)right {
    if(self.isAk_startSeparator) {
        [self.ak_separator mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(.7f);
            make.bottom.mas_equalTo(0.);
            make.leading.mas_equalTo(self.separatorInset.left);
            make.trailing.mas_equalTo(self.separatorInset.right);
        }];
    } else {
        self.preservesSuperviewLayoutMargins = NO;
        self.layoutMargins = UIEdgeInsetsZero;
        self.separatorInset = UIEdgeInsetsMake(self.separatorInset.top, self.separatorInset.left, self.separatorInset.bottom, right);
    }
}

- (BOOL)isAk_startSeparator {
    return !!objc_getAssociatedObject(self, UITableViewCellSeparatorKey);
}

- (void)setAk_startSeparator:(BOOL)start {
    if(self.isAk_startSeparator == start) {
        return;
    }
    
    if(start) {
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = AKColorV(223.);
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(.7);
            make.bottom.mas_equalTo(0.);
            make.leading.mas_equalTo(self.separatorInset.left);
            make.trailing.mas_equalTo(-self.separatorInset.right);
        }];
        objc_setAssociatedObject(self, UITableViewCellSeparatorKey, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        UIView *line = objc_getAssociatedObject(self, UITableViewCellSeparatorKey);
        [line removeFromSuperview];
        [line mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        objc_removeAssociatedObjects(line);
    }
}

- (UIView *)ak_separator {
    return objc_getAssociatedObject(self, UITableViewCellSeparatorKey);
}

@end
