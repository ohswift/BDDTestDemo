//
//  PersonInfo.h
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBookUI/AddressBookUI.h>

@interface PersonInfo : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *birthday;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName birthday:(NSDate *)birthday;
- (instancetype)initWithRecord:(ABRecordRef)abRecord;

@end
