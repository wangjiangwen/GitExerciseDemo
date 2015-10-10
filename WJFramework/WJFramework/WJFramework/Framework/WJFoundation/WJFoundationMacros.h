//
//  WKFoundationMacros.h
//  WJFramework
//
//  Created by wangjiangjiao on 15/9/30.
//  Copyright © 2015年 wangjiangjiao. All rights reserved.
//

#ifndef WJFoundationMacros_h
#define WJFoundationMacros_h

//Macros

#ifdef DEBUG
#define NSLog(s, ...)                   NSLog(@"<%@(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ## __VA_ARGS__])
#else
#define NSLog(s, ...)
#endif

//标记废弃方法
#define WJ_DEPRECATED NS_DEPRECATED_IOS(2_0, 4_0)
#define WJ_DEPRECATED(message)          __attribute((deprecated(message)))

#define WJ_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))

#define within_main_thread(block,...) \
try {} @finally {} \
do { \
if ([[NSThread currentThread] isMainThread]) { \
if (block) { \
block(__VA_ARGS__); \
} \
} else { \
if (block) { \
dispatch_async(dispatch_get_main_queue(), ^(){ \
block(__VA_ARGS__); \
}); \
} \
} \
} while(0)

#define within_main_thread_sync(block,...) \
try {} @finally {} \
do { \
if ([[NSThread currentThread] isMainThread]) { \
if (block) { \
block(__VA_ARGS__); \
} \
} else { \
if (block) { \
dispatch_async(dispatch_get_main_queue(), ^(){ \
CFRunLoopPerformBlock(CFRunLoopGetMain(), kCFRunLoopCommonModes, ^{ \
block(__VA_ARGS__); \
}); \
}); \
} \
} \
} while(0)

#if (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0)
#define WJDispatch_release(value) dispatch_release(value)
#else
#define WJDispatch_release(value)
#endif



#endif /* WKFoundationMacros_h */
