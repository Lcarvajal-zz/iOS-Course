//
//  CreatePostViewController.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "FeedPost.h"

@interface CreatePostViewController : UIViewController

@property FeedPost* post;
@property User* currentUser;

@end
