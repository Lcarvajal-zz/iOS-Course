//
//  LoginViewController.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property BOOL loggedin;    // for ensuring user does not login twice

- (IBAction)loginPressed:(id)sender;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    
    // hide navigation bar
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loggedin = NO; // user has not tried logging in
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginPressed:(id)sender {
    
    if (self.loggedin)
        return;
    
    // user has already pressed log in
    self.loggedin = YES;
    
    // convert email input into username
    NSString* username = [self.emailTF.text lowercaseString];
    username = [username stringByReplacingOccurrencesOfString:@"@my.fsu.edu" withString:@""];
    
    
    [PFUser logInWithUsernameInBackground:username password:self.passwordTF.text block:^(PFUser *user, NSError *error) {
        if (user) {
            // user logs in
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
        } else {
            // error in login
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                           message:errorString
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Ok"
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction* action) {}];
            // add action to alert and show to user
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];

        }
        self.loggedin = NO; // reset user logged in
    }];
    
}
@end
