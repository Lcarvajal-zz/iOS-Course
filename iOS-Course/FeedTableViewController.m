//
//  FeedTableViewController.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "FeedTableViewController.h"
#import "ViewPostViewController.h"
#import "Feed.h"
#import "FeedPost.h"
#import <Parse/Parse.h>

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

- (void)viewWillAppear:(BOOL)animated {
    if (!_feed) {
        // pull all posts from feed
        _feed = [[Feed alloc] init];
    }
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set garnet coller nav controller
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed: 100.0/255.0f green:32.0/255.0f blue:49.0/255.0f alpha:1.0]];
    
    // remove extra separators from tableview
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
     
    // Refresh on pull down
    if(!self.refreshControl) {
        self.refreshControl = [[UIRefreshControl alloc] init];
        self.refreshControl.backgroundColor = [UIColor colorWithRed: 100.0/255.0f green:32.0/255.0f blue:49.0/255.0f alpha:1.0];
        self.refreshControl.tintColor = [UIColor whiteColor];
        [self.refreshControl addTarget:self
                            action:@selector(getLatestPosts)
                  forControlEvents:UIControlEventValueChanged];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  GET LATEST POSTS

- (void) getLatestPosts {
    [self.tableView reloadData];            // reload table view
    [self.refreshControl endRefreshing];    // end refresh on pull down
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.feed.feed.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // set info for posts
    FeedPost* feedPost = [self.feed getFeedPost:(int)indexPath.row];
    cell.textLabel.text = feedPost.title;
    cell.detailTextLabel.text = feedPost.author;

    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // set post to be viewed
    self.feedPost =  [self.feed getFeedPost:(int)indexPath.row];
    
    // remove cell selection
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"viewPostSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"viewPostSegue"]) {
        
        // Get destination view
        ViewPostViewController *vc = [segue destinationViewController];
        
        // send post being viewed
        vc.feedPost = [[FeedPost alloc] initWithTitle:self.feedPost.title
                                               author:self.feedPost.author
                                              content:self.feedPost.content];
        
    }
}

@end
