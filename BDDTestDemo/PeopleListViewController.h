//
//  PeopleListViewController.h
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeopleListDataProviderProtocol.h"
#import "APICommunicatorProtocol.h"

@interface PeopleListViewController : UITableViewController

@property (strong, nonatomic) id<PeopleListDataProviderProtocol> dataProvider;
@property (strong, nonatomic) NSUserDefaults *userDefaults;
@property (strong, nonatomic) id<APICommunicatorProtocol> communicator;

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person;

@end
