//
//  PersonInfo.m
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import "PersonInfo.h"


@implementation PersonInfo

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName birthday:(NSDate *)birthday {
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.birthday = birthday;
    }
    return self;
}

- (instancetype)initWithRecord:(ABRecordRef)abRecord {
    self = [super init];
    if (self) {
        self.firstName = (__bridge_transfer NSString *)(ABRecordCopyValue(abRecord, kABPersonFirstNameProperty));
        self.lastName = (__bridge_transfer NSString *)(ABRecordCopyValue(abRecord, kABPersonLastNameProperty));
        self.birthday = (__bridge_transfer NSDate *)(ABRecordCopyValue(abRecord, kABPersonBirthdayProperty));
    }
    return self;
}

#pragma clang diagnostic pod

@end
