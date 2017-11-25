//
//  AKViewController.m
//  UIKit-AKExtension
//
//  Created by 李翔宇 on 2017/11/21.
//

#import "AKViewController.h"
#import <Masonry/Masonry.h>
#import "UIKit-AKInheritMacros.h"

@interface AKViewController ()

@end

@implementation AKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
//    if(self.navigationController.viewControllers.count > 1) {
//        UIKit_AKInheritWeakify(self)
//        
//        [AKViewController.popBarButtonItem add];
//        self.navigationItem.leftBarButtonItem = AKViewController.popBarButtonItem;
//        
//        [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"nav_arrow_left.png"] style:UIBarButtonItemStylePlain handler:^(id sender) {
//            UIKit_AKInheritStrongify(self)
//            [self htp_backBarButtonItemTouchUpInsideToPop:sender];
//        }];
//    } else {
//        if(self.presentingViewController) {
//            @weakify(self)
//            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"nav_close.png"] style:UIBarButtonItemStylePlain handler:^(id sender) {
//                @strongify(self)
//                [self htp_closeBarButtonItemTouchUpInsideToDismiss:sender];
//            }];
//        }
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
