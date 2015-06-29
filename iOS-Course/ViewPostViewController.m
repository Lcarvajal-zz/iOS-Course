//
//  ViewPostViewController.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "ViewPostViewController.h"

@interface ViewPostViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *authorL;

@property (weak, nonatomic) IBOutlet UITextView *contentTV;

@end

@implementation ViewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // show navigation bar with post title
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.title = self.feedPost.title;
    
    // show post on view
    self.titleL.text = self.feedPost.title;
    self.authorL.text = self.feedPost.author;
    self.contentTV.text = self.feedPost.content;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
