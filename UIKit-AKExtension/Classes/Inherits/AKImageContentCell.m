//
//  AKImageContentCell.m
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/9.
//

#import "AKImageContentCell.h"
#import <Masonry/Masonry.h>
#import <UIKit_AKExtension/UIKit-AKConfig.h>
#import "UIKit-AKInheritMacros.h"

@interface AKImageContentCell()

@property (nonatomic, strong) UIImageView *adjustImageView;

@end

@implementation AKImageContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _adjustImageView = [[UIImageView alloc] initWithImage:nil];
        [self.contentView addSubview:_adjustImageView];
        
        MASAttachKeys(_adjustImageView)
    }
    return self;
}

@end
