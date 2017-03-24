//
//  Person.h
//  TestDemo
//
//  Created by panhongliu on 2017/2/16.
//  Copyright © 2017年 panhongliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>



@property(nonatomic,copy)NSString *hello;
@property(nonatomic,copy)NSString *good;

+(Person *)read;
-(BOOL)write;
+(BOOL)delegateAccount;


+(void)run;
+(void)study;

@end
