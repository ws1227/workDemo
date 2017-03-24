//
//  Person+category.m
//  TestDemo
//
//  Created by panhongliu on 2017/2/16.
//  Copyright © 2017年 panhongliu. All rights reserved.
//

#import "Person+category.h"
#import <objc/runtime.h>
@implementation Person (category)
const static char studyName;

-(NSString *)study
{
    return objc_getAssociatedObject(self, &studyName);
    
    
}

-(void)setStudy:(NSString *)study
{

    objc_setAssociatedObject(self, &studyName, study, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
}
@end
