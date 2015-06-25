//
//  User.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//
/**
 *  This class holds the information each user for the app needs for a profile.
 *
 */

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSString* website;
@property (nonatomic, copy) NSString* hobbies;
@property (nonatomic, copy) NSString* about;

- (void) setCurrentUser;    // turn user into currently logged in user

@end
