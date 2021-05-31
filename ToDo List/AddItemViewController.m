//
//  AppDelegate.h
//  ToDoAppObjCiOS
//
//  Created by Yahya Mokaied on 03/02/2020.
//  Copyright © 2020 Yahya Mokaied. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
/*
- (IBAction)save:(id)sender {
    [self.delegate didSaveNewTodo:self.textField.text];
    [self dismissViewControllerAnimated:true completion:nil];
    
    
}
 */


- (IBAction)saveNew:(id)sender {
    [self.delegate didSaveNewTodo:self.textField.text];
       [self dismissViewControllerAnimated:true completion:nil];
    NSLog(@"%@" , self.textField.text);
       
}
@end
