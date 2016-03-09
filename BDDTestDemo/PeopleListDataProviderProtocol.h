//
//  PeopleListDataProviderProtocol.h
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PersonInfo.h"

@protocol PeopleListDataProviderProtocol <NSObject, UITableViewDataSource>

@property (strong, nonatomic)   NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic)   UITableView *tableView;

- (void)addPerson:(PersonInfo *)personInfo;
- (void)fetch;

@end



