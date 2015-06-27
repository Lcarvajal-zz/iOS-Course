//
//  CreatePostViewController.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "CreatePostViewController.h"
#import <Parse/Parse.h>
#import "User.h"
#import "FeedPost.h"

@interface CreatePostViewController ()

@property (weak, nonatomic) IBOutlet UITextField *postTitleTF;
@property (weak, nonatomic) IBOutlet UITextView *postTextTV;

- (IBAction)cancelButton:(id)sender;

- (IBAction)postButton:(id)sender;

@end

@implementation CreatePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.currentUser setCurrentUser];
    
    [self.postTitleTF becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(id)sender {
    // go to previous view
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)postButton:(id)sender {
    
    // set post variables
    _post = [[FeedPost alloc] initWithTitle:self.postTitleTF.text
                                     author:self.currentUser.name
                                    content:self.postTextTV.text];
    
    // save post with user string attached
    PFObject *post= [PFObject objectWithClassName:@"Post"];
    [post setObject:self.post.title forKey:@"Title"];
    [post setObject:[PFUser currentUser] forKey:@"Author"];
    [post setObject:[PFUser currentUser] forKey:@"Content"];
    
    // go to previous view
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
