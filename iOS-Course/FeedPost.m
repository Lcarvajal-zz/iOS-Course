//
//  FeedPost.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "FeedPost.h"

@implementation FeedPost

@synthesize title = _title;
@synthesize author = _author;
@synthesize content = _content;


-(id)initWithTitle:(NSString*)title
            author:(NSString*)author
           content:(NSString*)content {
    self = [super init];
    
    if(self) {
        _title = title;
        _author = author;
        _content = content;
    }
    
    return self;
}

@end
