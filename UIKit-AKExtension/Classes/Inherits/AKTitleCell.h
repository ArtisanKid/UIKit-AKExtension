//
//  AKTitleCell.h
//  Pods
//
//  Created by 李翔宇 on 15/8/18.
//
//

#import <UIKit/UIKit.h>
#import <UIKit_AKExtension/UITableViewCell-AKProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@interface AKTitleCell : UITableViewCell<UITableViewCell_AKProtocol>

@property (nonatomic, strong, readonly) UILabel *titleLabel;

/**
 *  AKDrawContent:
 *
 *  @param object NSString 或者 NSAttributedString，或者相应description方法的对象
 */
- (void)AKDrawContent:(id _Nullable)object;

@end

NS_ASSUME_NONNULL_END
