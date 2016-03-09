//
//  PeopleListViewController.m
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import "PeopleListViewController.h"
#import "APICommunicator.h"
#import <AddressBookUI/AddressBookUI.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface PeopleListViewController ()<ABPeoplePickerNavigationControllerDelegate>

//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PeopleListViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        self.communicator = [APICommunicator new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [self editButtonItem];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addPerson)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.tableView.dataSource = self.dataProvider;
    self.dataProvider.tableView = self.tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addPerson {
    ABPeoplePickerNavigationController *picker = [ABPeoplePickerNavigationController new];
    picker.peoplePickerDelegate = self;
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}


- (void)fetchPeopleFromAPI {
    NSError *error = nil;
    NSArray *allPersonInfos = [self.communicator getPeople];
    for (PersonInfo *info in allPersonInfos) {
        [self.dataProvider addPerson:info];
    }
}

- (void)sendPersonToAPI:(PersonInfo *)personInfo {
    NSError *error = nil;
    [self.communicator postPerson:personInfo error:&error];
}

#pragma mark - ABPeoplePickerNavigationControllerDelegate

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person {
    PersonInfo *personInfo = [[PersonInfo alloc] initWithRecord:person];
    [self.dataProvider addPerson:personInfo];
}

- (IBAction)changeSorting:(UISegmentedControl *)sender {
    [self.userDefaults setInteger:sender.selectedSegmentIndex forKey:@"sort"];
    [self.dataProvider fetch];
}

@end

#pragma clang diagnostic pop


