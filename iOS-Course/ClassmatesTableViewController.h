//
//  ClassmatesTableViewController.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Users.h"

@interface ClassmatesTableViewController : UITableViewController

@property Users* users;
@property User* viewUser;

@end
