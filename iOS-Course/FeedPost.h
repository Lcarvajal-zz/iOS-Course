//
//  FeedPost.h
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedPost : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* author;
@property (nonatomic, copy) NSString* content;

-(id)initWithTitle:(NSString*)title
            author:(NSString*)author
           content:(NSString*)content;

@end
