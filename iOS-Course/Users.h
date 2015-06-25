//
//  Users.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//
/**
 * This class uses User to create an array that pulls the information from Parse servers.
 */


#import <Foundation/Foundation.h>
#import "User.h"

@interface Users : NSObject

@property NSArray* classmates;
@property NSMutableArray* users;

- (User*) getUser:(int) index;
- (int) userCount;

@end
