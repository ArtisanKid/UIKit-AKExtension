//
//  AKTextField.h
//  HowToPay
//
//  Created by 李翔宇 on 2017/10/10.
//  Copyright © 2017年 ArtisanKid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKTextField : UITextField

@property (nonatomic, assign) CGRect ak_placeholderRect;
@property (nonatomic, strong) UIFont *ak_placeholderFont;
@property (nonatomic, strong) UIColor *ak_placeholderColor;

@end
