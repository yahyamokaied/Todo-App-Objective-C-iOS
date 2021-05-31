//
//  AppDelegate.h
//  ToDoAppObjCiOS
//
//  Created by Yahya Mokaied on 03/02/2020.
//  Copyright © 2020 Yahya Mokaied. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property (nonatomic) NSString * description;
@property (nonatomic) NSString * dateAndTime;
@property (nonatomic) NSString * place;
@property (nonatomic) BOOL * clear;

@end

NS_ASSUME_NONNULL_END
