//
//  UIKit-AKMacros.h
//  Pods
//
//  Created by 李翔宇 on 2017/7/13.
//
//

#ifndef UIKit_AKMacros_h
#define UIKit_AKMacros_h

#if DEBUG
    #define UIKit_AKExtensionLog(_Format, ...)\
    do {\
        NSString *file = [NSString stringWithUTF8String:__FILE__].lastPathComponent;\
        NSLog((@"\n[%@][%d][%s]\n" _Format), file, __LINE__, __PRETTY_FUNCTION__, ## __VA_ARGS__);\
        printf("\n");\
    } while(0)
#else
    #define UIKit_AKExtensionLog(_Format, ...)
#endif

#endif /* UIKit_AKMacros_h */
