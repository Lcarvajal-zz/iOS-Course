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
    
    self.viewPicIV.image = self.viewUser.profilePic;
    self.viewNameTF.text = self.viewUser.name;
    self.viewEmailTF.text = self.viewUser.username;
    self.viewWebsiteTF.text = self.viewUser.website;
    self.viewHobbiesTF.text = self.viewUser.hobbies;
    self.viewAboutTF.text = self.viewUser.about;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
