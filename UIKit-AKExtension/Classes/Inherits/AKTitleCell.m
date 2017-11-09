//
//  AKTitleCell.m
//  Pods
//
//  Created by 李翔宇 on 15/8/18.
//
//

#import "AKTitleCell.h"
#import <Masonry/Masonry.h>
#import <UIKit_AKExtension/UIKit-AKConfig.h>

@implementation AKTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_titleLabel];
        
        MASAttachKeys(_titleLabel)
        
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(UITableViewCell_AKContentMargin_Left);
            make.trailing.mas_equalTo(-UITableViewCell_AKContentMargin_Right);
            make.centerY.mas_equalTo(0.);
        }];
    }
    return self;
}

#pragma mark- 协议方法
+ (CGFloat)AKMinimumHeight {
    return 44.;
}

//NSString 或者 NSAttributedString，或者相应description方法的对象
- (void)AKDrawContent:(id)object {
    if([object isKindOfClass:[NSString class]]) {
        self.titleLabel.text = object;
    } else if([object isKindOfClass:[NSAttributedString class]]) {
        self.titleLabel.attributedText = object;
    } else if([object respondsToSelector:@selector(description)]) {
        self.titleLabel.text = [object description];
    } else {
        //AKViewControllerLog(@"传入了错误类型的显示数据\n%@", object);
    }
}

@end
