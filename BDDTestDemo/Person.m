//
//  Person.m
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
