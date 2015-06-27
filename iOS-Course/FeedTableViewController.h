//
//  FeedTableViewController.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"
#import "FeedPost.h"

@interface FeedTableViewController : UITableViewController

@property Feed* feed;
@property FeedPost* feedPost;

@end
