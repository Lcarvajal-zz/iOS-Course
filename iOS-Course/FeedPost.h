//
//  FeedPost.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedPost : NSObject

@property NSString* title;
@property NSString* author;
@property NSString* content;

-(id)initWithTitle:(NSString*)title
            author:(NSString*)author
           content:(NSString*)content;

@end
