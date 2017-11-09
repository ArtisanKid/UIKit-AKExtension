//
//  AKImageContentCell.h
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/9.
//

#import "AKContentCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AKImageContentCell : AKContentCell

@property (nonatomic, strong, readonly) UIImageView *adjustImageView;

/**
 *  AKDrawContent:
 *
 *  @param objects @[图片(NSString/NSURL/UIImage), (NSString/NSAttributedString/description)]
 */
- (void)AKDrawContent:(NSArray<id> * _Nullable)objects;

@end

NS_ASSUME_NONNULL_END
