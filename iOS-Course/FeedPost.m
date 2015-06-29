//
//  FeedPost.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "FeedPost.h"

@implementation FeedPost

-(id)initWithTitle:(NSString*)title
            author:(NSString*)author
           content:(NSString*)content{
    self = [super init];
    
    if(self) {
        _title = [[NSString alloc] initWithString:title];
        _author = [[NSString alloc] initWithString:author];
        _content = [[NSString alloc] initWithString:content];
    }
    
    return self;
}

@end
