//
//  User.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "User.h"
#import <Parse/Parse.h>

@implementation User

@synthesize name = _name;
@synthesize username = _username;
@synthesize email = _email;
@synthesize website = _website;
@synthesize hobbies = _hobbies;
@synthesize about = _about;

- (void) setCurrentUser {
    self.name = [[PFUser currentUser] objectForKey:@"Name"];
    self.username = [[PFUser currentUser] username];
    self.email = [[PFUser currentUser] email];
    self.website = [[PFUser currentUser] objectForKey:@"website"];
    self.hobbies = [[PFUser currentUser] objectForKey:@"hobbies"];
    self.about = [[PFUser currentUser] objectForKey:@"about"];
}

@end
