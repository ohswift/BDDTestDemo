import Quick
import Nimble

class PeopleListDataProviderTests: QuickSpec {
    
    
    override func spec() {
        describe("data provider") {
            var storeCoordinator: NSPersistentStoreCoordinator!
            var managedObjectContext: NSManagedObjectContext!
            var managedObjectModel: NSManagedObjectModel!
            var store: NSPersistentStore!
            
            var dataProvider: PeopleListDataProvider!
            
            var tableView: UITableView!
            var testRecord: PersonInfo!
            
            beforeEach {
                managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
                storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
                store = try? storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
                
                managedObjectContext = NSManagedObjectContext()
                managedObjectContext.persistentStoreCoordinator = storeCoordinator
                
                dataProvider = PeopleListDataProvider()
                dataProvider.managedObjectContext = managedObjectContext
                
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PeopleListViewController") as! PeopleListViewController
                viewController.dataProvider = dataProvider
                
                tableView = viewController.tableView
                
                testRecord = PersonInfo(firstName: "TestFirstName", lastName: "TestLastName", birthday: NSDate())
            }
            context("set up") {
                it("store is setup") {
                    expect(store).notTo(beNil())
                }
            }
            context("add one person") {
                beforeEach {
                    dataProvider.addPerson(testRecord)
                }
                it("section should be 1") {
                    expect(tableView.dataSource!.numberOfSectionsInTableView!(tableView)) == 1
                }
                it("row should be 1") {
                    expect(tableView.dataSource!.tableView(tableView, numberOfRowsInSection: 0)) == 1
                }
                it("cell show full name") {
                    let cell = tableView.dataSource!.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as UITableViewCell
                    expect(cell.textLabel?.text) == "TestFirstName TestLastName"
                }
            }
        }
    }
}
