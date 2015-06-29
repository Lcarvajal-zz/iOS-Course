//
//  ViewProfileViewController.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/27/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "ViewProfileViewController.h"
#import "User.h"
#import <Parse/Parse.h>

@interface ViewProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *viewPicIV;
@property (weak, nonatomic) IBOutlet UITextField *viewNameTF;
@property (weak, nonatomic) IBOutlet UITextField *viewEmailTF;
@property (weak, nonatomic) IBOutlet UITextField *viewWebsiteTF;

@property (weak, nonatomic) IBOutlet UITextField *viewHobbiesTF;
@property (weak, nonatomic) IBOutlet UITextView *viewAboutTF;

@end

@implementation ViewProfileViewController

- (void)viewWillAppear:(BOOL)animated {
    //if (self.viewUser)
        //[self.viewUser loadProfilePicture];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUserProfile];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// LOAD USER PROFILE
- (void) loadUserProfile {
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"email" equalTo:self.viewUser.email];
    NSArray *array = [query findObjects];
    PFFile *userImageFile = [[array objectAtIndex:0] objectForKey:@"profilePic"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.viewPicIV.image = [UIImage imageWithData:imageData];
        }
        else {
            NSLog(@"profile photo not found!");
        }
    }];
    
    self.viewPicIV.image = self.viewUser.profilePic;
    self.viewNameTF.text = self.viewUser.name;
    self.viewEmailTF.text = self.viewUser.username;
    self.viewWebsiteTF.text = self.viewUser.website;
    self.viewHobbiesTF.text = self.viewUser.hobbies;
    self.viewAboutTF.text = self.viewUser.about;
}

@end
