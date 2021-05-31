//
//  AppDelegate.h
//  ToDoAppObjCiOS
//
//  Created by Yahya Mokaied on 03/02/2020.
//  Copyright © 2020 Yahya Mokaied. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddItemViewControllerDelegate <NSObject>
-(void)didSaveNewTodo: (NSString *)todoText;
@end

NS_ASSUME_NONNULL_BEGIN

@interface AddItemViewController : UIViewController
@property (nonatomic , strong) id <AddItemViewControllerDelegate> delegate;
//@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

- (IBAction)saveNew:(id)sender;

@end

NS_ASSUME_NONNULL_END
