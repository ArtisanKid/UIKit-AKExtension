//
//  AKArrowCell.m
//  Pods
//
//  Created by 李翔宇 on 15/11/30.
//
//

#import "AKArrowCell.h"
#import <Masonry/Masonry.h>

@interface AKArrowCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation AKArrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.];
        _titleLabel.textColor = [UIColor darkGrayColor];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.contentView addSubview:_titleLabel];
        
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:14.];
        _subTitleLabel.textColor = UIColor.lightGrayColor;
        [_subTitleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.contentView addSubview:_subTitleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(10.);
            make.centerY.mas_equalTo(0.);
        }];
        
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_greaterThanOrEqualTo(_titleLabel.mas_trailing).offset(10.);
            make.trailing.mas_equalTo(-10.);
            make.centerY.mas_equalTo(0.);
        }];
    }
    return self;
}

#pragma mark - 重载方法
+ (CGFloat)AKHeightOfContent:(id)content {
    return 44.;
}

//@[title, subTitle]
- (void)AKDrawContent:(NSArray<NSString *> *)content {
    self.titleLabel.text = content.firstObject;
    if(content.count < 2) {
        self.subTitleLabel.text = nil;
        self.subTitleLabel.hidden = YES;
        return;
    }
    self.subTitleLabel.hidden = NO;
    self.subTitleLabel.text = content.lastObject;
}

@end
