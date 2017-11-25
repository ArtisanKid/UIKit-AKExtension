//
//  UIKit-AKInheritMacros.h
//  Pods
//
//  Created by 李翔宇 on 2017/10/23.
//

#ifndef UIKit_AKInheritMacros_h
#define UIKit_AKInheritMacros_h

#if DEBUG
    #define UIKit_AKInheritLog(_Format, ...)\
    do {\
        NSString *file = [NSString stringWithUTF8String:__FILE__].lastPathComponent;\
        NSLog((@"\n[%@][%d][%s]\n" _Format), file, __LINE__, __PRETTY_FUNCTION__, ## __VA_ARGS__);\
        printf("\n");\
    } while(0)
#else
    #define UIKit_AKInheritLog(_Format, ...)
#endif

#define UIKit_AKInheritWeakify(_obj) __weak typeof(_obj) weak__obj = _obj;
#define UIKit_AKInheritStrongify(_obj) __strong typeof(weak__obj) _obj = weak__obj;

#endif /* UIKit_AKInheritMacros_h */
