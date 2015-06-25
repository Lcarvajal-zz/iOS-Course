//
//  Users.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "Users.h"
#import "User.h"
#import <Parse/Parse.h>

@implementation Users

- (id)init {
    
    self = [super init];
    
    if(self) {
        if (!_classmates)
            _classmates = [[NSArray alloc] init];
        
        if(!_users)
            _users = [[NSMutableArray alloc] init];
    }
    
    // perform query for classmates info
    PFQuery *query = [PFUser query];
    self.classmates = [query findObjects];
    
    for (int i = 0; i < self.classmates.count; i++) {
        
        // individual user info
        User* user = [[User alloc] init];
        user.name = [[self.classmates objectAtIndex:i] objectForKey:@"Name"];
        user.email = [[self.classmates objectAtIndex:i] username];
        user.email = [[self.classmates objectAtIndex:i] email];
        user.hobbies = [[self.classmates objectAtIndex:i] objectForKey:@"hobbies"];
        user.about = [[self.classmates objectAtIndex:i] objectForKey:@"about"];
        
        [self.users addObject:user ];
    }
    
    return self;
}

- (User*) getUser:(int) index {
    return [self.users objectAtIndex:index];
}

- (int) userCount {
    return (int) [self.users count];
}

@end

