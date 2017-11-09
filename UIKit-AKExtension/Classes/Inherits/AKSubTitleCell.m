//
//  AKSubTitleCell.m
//  Pods
//
//  Created by 李翔宇 on 15/8/18.
//
//

#import "AKSubTitleCell.h"
#import <Masonry/Masonry.h>

@interface AKSubTitleCell ()

@property (nonatomic, strong) MASConstraint *subTitleLabel_centerY_constraint;/**<控件对齐约束*/
@property (nonatomic, strong) MASConstraint *subTitleLabel_bottom_constraint;/**<控件对齐约束*/

@end

@implementation AKSubTitleCell

#pragma mark - 生命周期
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.];
        _titleLabel.textColor = [UIColor darkGrayColor];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.contentView addSubview:_titleLabel];
        
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:14.];
        _subTitleLabel.textColor = [UIColor lightGrayColor];
        [_subTitleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.contentView addSubview:_subTitleLabel];
        
        MASAttachKeys(self, _titleLabel, _subTitleLabel)
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(10.);
            make.centerY.mas_equalTo(0.);
        }];
        
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(_titleLabel.mas_trailing).offset(10.);
            make.trailing.mas_lessThanOrEqualTo(-10.);
            _subTitleLabel_centerY_constraint = make.centerY.mas_equalTo(0.);
            _subTitleLabel_bottom_constraint = make.bottom.mas_equalTo(_titleLabel.mas_bottom);
        }];
        
        [_subTitleLabel_bottom_constraint deactivate];
    }
    return self;
}

#pragma mark- 协议方法
+ (CGFloat)AKMinimumHeight {
    return 44.;
}

//@[title, subTitle]
- (void)AKDrawContent:(NSArray<NSString *> * _Nullable)object {
    self.titleLabel.text = object.firstObject;
    if(object.count < 2) {
        self.subTitleLabel.text = nil;
        self.subTitleLabel.hidden = YES;
        return;
    }
    self.subTitleLabel.hidden = NO;
    self.subTitleLabel.text = object.lastObject;
}

#pragma mark- 公开方法
- (void)setAk_bottomAlignment:(BOOL)bottomAlignment {
    if(_ak_bottomAlignment == bottomAlignment) {
        return;
    }
    
    _ak_bottomAlignment = bottomAlignment;
    if(bottomAlignment) {
        [self.subTitleLabel_centerY_constraint deactivate];
        [self.subTitleLabel_bottom_constraint activate];
    } else {
        [self.subTitleLabel_centerY_constraint activate];
        [self.subTitleLabel_bottom_constraint deactivate];
    }
    
    [self layoutIfNeeded];
}

@end
