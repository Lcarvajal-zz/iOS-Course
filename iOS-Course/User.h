//
//  User.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSArray* hobbies;
@property (nonatomic, copy) NSString* about;

@end
