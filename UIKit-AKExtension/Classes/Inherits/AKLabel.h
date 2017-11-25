//
//  AKLabel.h
//  HowToPay
//
//  Created by 李翔宇 on 2017/10/20.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKLabel : UILabel

//内边距
@property (nonatomic, assign) UIEdgeInsets ak_textEdgeInsets;

@property (nonatomic, assign) CGRect ak_textRectForBounds;
@property (nonatomic, assign) CGRect ak_drawTextInRect;

@end
