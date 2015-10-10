//
//  LoginViewModel.h
//  ReactiveCocoa
//
//  Created by wangjiangjiao on 15/10/10.
//  Copyright © 2015年 wangjiangjiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (nonatomic, strong) NSArray * loginArray;

- (void)loadNewArray;

@end
