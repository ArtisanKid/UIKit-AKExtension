//
//  AKContentCell.h
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/9.
//

#import <UIKit/UIKit.h>
#import <UIKit_AKExtension/UITableViewCell-AKProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@interface AKContentCell : UITableViewCell<UITableViewCell_AKProtocol>

@property (nonatomic, strong, readonly) UILabel *contentLabel;

/**
 *  AKDrawContent:
 *
 *  @param object NSString 或者 NSAttributedString，或者相应description方法的对象
 */
- (void)AKDrawContent:(id _Nullable)object;

@end

NS_ASSUME_NONNULL_END
