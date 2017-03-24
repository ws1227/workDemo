//
//  NSObject+Extension.h
//  TestDemo
//
//  Created by panhongliu on 2017/2/17.
//  Copyright © 2017年 panhongliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
- (NSArray *)ignoredNames;
- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;
@end
