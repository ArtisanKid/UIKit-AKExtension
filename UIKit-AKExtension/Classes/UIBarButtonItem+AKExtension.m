//
//  UIBarButtonItem+AKExtension.m
//  Pods
//
//  Created by 李翔宇 on 16/6/14.
//
//

#import "UIBarButtonItem+AKExtension.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>
#import "UIColor+AKExtension.h"

static const void * const UIBarButtonItemActionKey = &UIBarButtonItemActionKey;

@implementation UIBarButtonItem (AKExtension)

#pragma mark - Runtime Associate
@dynamic ak_button;
- (UIButton *)ak_button {
    return (UIButton *)self.customView;
}

- (void)setAk_action:(AKBarButtonItemAction)action {
    objc_setAssociatedObject(self, UIBarButtonItemActionKey, action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AKBarButtonItemAction)ak_action {
    return objc_getAssociatedObject(self, UIBarButtonItemActionKey);
}

#pragma mark - Public Method
+ (UIBarButtonItem *)ak_itemWithContent:(id)content action:(void (^)(UIBarButtonItem * _Nonnull))action {
    return [self ak_itemWithContent:^id _Nullable(UIControlState state) {
        return content;
    } states:UIControlStateNormal action:action];
}

+ (UIBarButtonItem *)ak_itemWithStates:(UIControlState)states content:(id)firstObject, ... {
    NSMutableDictionary *dicM = NSMutableDictionary.dictionary;
    dicM[@(UIControlStateNormal)] = firstObject;
    
    va_list ap;//定义指向个数可变的参数列表指针
    va_start(ap, firstObject);//va_start 初始化参数列表指针，列表指针指向第一个参数地址
    for(int i = 0; i < 4; i++) {
        if(states & (1 << i)) {
            firstObject = va_arg(ap, id);//va_arg 指向下一个参数地址，并返回
            if(!firstObject) {
                break;
            }
            dicM[@(1 << i)] = firstObject;
        }
    }
    va_end(ap);//置空
    
    return [self ak_itemWithContent:^id _Nullable(UIControlState state) {
        return dicM[@(state)];
    } states:states action:^(UIBarButtonItem * _Nonnull sender) {}];
}

+ (UIBarButtonItem *)ak_itemWithContent:(AKBarButtonItemContent)contentBlock
                                 states:(UIControlState)states
                                 action:(AKBarButtonItemAction)action {
    UIButton *button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.clipsToBounds = NO;
        button.exclusiveTouch = YES;
        button.contentMode = UIViewContentModeCenter;
        button.contentMode = UIViewContentModeCenter;
//        [button setTitleColor:AKColorGray51 forState:UIControlStateNormal];
//        [button setTitleColor:AKColorGray102 forState:UIControlStateHighlighted];
//        [button setTitleColor:AKColorGray153 forState:UIControlStateDisabled];
        [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    //配置button的AutoLayout
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0., 0., 0., 0.));
    }];
    
    if(contentBlock) {
        //配置内容
        id content = contentBlock(UIControlStateNormal);
        [item setContent:content state:UIControlStateNormal];
        
        for(int i = 0; i < 4; i++) {
            if(states & (1 << i)) {
                id content = contentBlock(1 << i);
                [item setContent:content state:1 << i];
            }
        }
    }
    
    //配置动作
    item.ak_action = action;
    return item;
}

#pragma mark - Private Method
- (void)setContent:(id)content state:(UIControlState)state {
    UIButton *button = (UIButton *)self.customView;
    if([content isKindOfClass:NSString.class]) {
        [button setTitle:content forState:UIControlStateNormal];
        [button setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    } else if([content isKindOfClass:UIImage.class]) {
        [button setImage:content forState:UIControlStateNormal];
    }
}

- (void)buttonTouchUpInside:(UIButton *)sender {
    AKBarButtonItemAction action = self.ak_action;
    !action ? : action(self);
}

@end
