//
//  AKContentCell.m
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/9.
//

#import "AKContentCell.h"
#import <Masonry/Masonry.h>
#import <UIKit_AKExtension/UIKit-AKConfig.h>
#import "UIKit-AKInheritMacros.h"

@interface AKContentCell()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation AKContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.numberOfLines = 0;
        [_contentLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_contentLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.contentView addSubview:_contentLabel];
        
        MASAttachKeys(_contentLabel)
        
        [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UITableViewCell_AKContentMargin);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.contentView updateConstraintsIfNeeded];
    [self.contentView layoutIfNeeded];
    
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bounds) - UITableViewCell_AKContentMargin_Left - UITableViewCell_AKContentMargin_Right;
}

#pragma mark- 协议方法
+ (CGFloat)AKMinimumHeight {
    return 44.;
}

//NSString 或者 NSAttributedString，或者相应description方法的对象
- (void)AKDrawContent:(id)object {
    if([object isKindOfClass:[NSString class]]) {
        self.contentLabel.text = object;
    } else if([object isKindOfClass:[NSAttributedString class]]) {
        self.contentLabel.attributedText = object;
    } else if([object respondsToSelector:@selector(description)]) {
        self.contentLabel.text = [object description];
    } else {
        UIKit_AKInheritLog(@"传入了错误类型的显示数据\n%@", object);
    }
}

@end
