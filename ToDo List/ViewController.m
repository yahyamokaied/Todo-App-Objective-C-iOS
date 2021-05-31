//
//  AppDelegate.h
//  ToDoAppObjCiOS
//
//  Created by Yahya Mokaied on 03/02/2020.
//  Copyright © 2020 Yahya Mokaied. All rights reserved.
//

#import "ViewController.h"
#import "ListCellTableViewCell.h"
#import "AddItemViewController.h"

@interface ViewController () <UITableViewDelegate , UITableViewDataSource , AddItemViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *items;
@property (nonatomic) NSMutableDictionary *finsihItem;
//@property(nonatomic) NSUserDefaults *userDefaults;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"To-Do list";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger check =
    [userDefaults integerForKey:@"olddata"];
    if (check == 1){
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        self.items = [[NSUserDefaults standardUserDefaults ] mutableArrayValueForKey:@"my"];
        self.finsihItem =[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"finish"];
        
        
          
        
    }else{
        self.items = @[@{@"name" : @"Call the car workshop" , @"category" : @"Home"}].mutableCopy;
      
    }
 
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"TodoItemRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *item = self.items[indexPath.row];
    cell.textLabel.text = item[@"name"];
    
    if([item[@"completed"]boolValue]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AddItemViewController *addVC = segue.destinationViewController;
    addVC.delegate = self;
    

}

- (void)didSaveNewTodo:(NSString *)todoText{
    NSLog(@"%@" , todoText);
    NSDictionary *item = @{@"name" : todoText,@"category" : @"Home"};
    [self.items addObject:item];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"olddata"];
    [userDefaults setObject:self.items forKey:@"my"] ;
    [userDefaults synchronize];
    [self.tableView reloadData];
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.finsihItem = [self.items[indexPath.row] mutableCopy];
    BOOL completed = [_finsihItem[@"completed"] boolValue];
    _finsihItem[@"completed"] = @(!completed);
    self.items[indexPath.row] = _finsihItem;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = ([_finsihItem[@"completed"]boolValue]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"olddata"];
    [userDefaults setObject:_finsihItem forKey:@"finish"] ;
    [userDefaults synchronize];
    
}
@end
