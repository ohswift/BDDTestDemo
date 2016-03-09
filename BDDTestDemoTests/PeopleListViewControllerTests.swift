import Quick
import Nimble

class PeopleListViewControllerTests: QuickSpec {
    override func spec() {
        describe("PeopleList") {
            var viewController:PeopleListViewController!
            var provider:MockDataProvider!
            beforeEach {
                viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PeopleListViewController") as! PeopleListViewController
                provider = MockDataProvider()
                viewController.dataProvider = provider;
            }
            context("viewDidLoad") {
                it("provider not has tableView before viewDidLoad") {
                    expect(provider.tableView).to(beNil())
                }
                it("provider has tableView after viewDidLoad") {
                    let _ = viewController.view;
                    expect(provider.tableView).toNot(beNil())
                }
                it("bar button are set") {
                    let _ = viewController.view;
                    let rightBarButton = viewController.navigationItem.rightBarButtonItem;
                    expect(rightBarButton).notTo(beNil());
                    expect(rightBarButton!.action).to(equal(Selector("addPerson")))
                }
            }
            context("add person") {
                it("provider should call addPerson") {
                    let record: ABRecord = ABPersonCreate().takeRetainedValue()
                    ABRecordSetValue(record, kABPersonFirstNameProperty, "TestFirstname", nil)
                    ABRecordSetValue(record, kABPersonLastNameProperty, "TestLastname", nil)
                    ABRecordSetValue(record, kABPersonBirthdayProperty, NSDate(), nil)
                    viewController.peoplePickerNavigationController(ABPeoplePickerNavigationController(), didSelectPerson: record)
                    expect(provider.addPersonGotCalled).to(beTruthy())
                }
            }
            context("change segment") {
                var mockUserDefaults:MockUserDefaults!
                beforeEach {
                    mockUserDefaults = MockUserDefaults(suiteName: "testing")!
                    viewController.userDefaults = mockUserDefaults
                }
                it("must change userdefault") {
                    let segmentedControl = UISegmentedControl()
                    segmentedControl.selectedSegmentIndex = 0
                    segmentedControl.addTarget(viewController, action: "changeSorting:", forControlEvents: .ValueChanged)
                    segmentedControl.sendActionsForControlEvents(.ValueChanged)
                    expect(mockUserDefaults.sortWasChanged).to(beTruthy())
                }
            }
        }
    }
}


class MockDataProvider: NSObject, PeopleListDataProviderProtocol {
    var addPersonGotCalled = false
    var managedObjectContext: NSManagedObjectContext?
    weak var tableView: UITableView?
    func addPerson(personInfo: PersonInfo) { addPersonGotCalled = true }
    func fetch() { }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { return UITableViewCell() }
}

class MockUserDefaults: NSUserDefaults {
    var sortWasChanged = false
    override func setInteger(value: Int, forKey defaultName: String) {
        if defaultName == "sort" {
            sortWasChanged = true
        }
    }
}

class MockCommunicator: NSObject, APICommunicatorProtocol {
    func getPeople() -> [AnyObject]! {
        return nil
    }
    func postPerson(personInfo: PersonInfo!, error: NSErrorPointer) {
        
    }
}



