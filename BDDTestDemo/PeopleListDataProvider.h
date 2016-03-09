//
//  PeopleListDataProvider.h
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeopleListDataProviderProtocol.h"

@interface PeopleListDataProvider : NSObject<PeopleListDataProviderProtocol>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) UITableView *tableView;

@end
