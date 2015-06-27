//
//  Feed.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "Feed.h"
#import "FeedPost.h"
#import <Parse/Parse.h>

@implementation Feed

- (id)init {
    self = [super init];
    
    if (self) {
        PFQuery *postsQuery = [PFQuery queryWithClassName:@"Post"];
        
        [postsQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully loaded post");
                
                self.feed = [[NSArray alloc] initWithArray:objects];
                
                for (PFObject *object in objects) {
                    NSLog(@"%@", object.objectId);
                }
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
    
    return self;
}

- (FeedPost*)getFeedPost:(int)numPosts {
    FeedPost* feedpost = [[FeedPost alloc] initWithTitle:[[self.feed objectAtIndex:numPosts] objectForKey:@"Title"]
                                              author:[[self.feed objectAtIndex:numPosts] objectForKey:@"Author"]
                                                 content:[[self.feed objectAtIndex:numPosts] objectForKey:@"Content"]];
    
    return feedpost;
}


@end


