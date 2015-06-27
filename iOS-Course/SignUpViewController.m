//
//  SignUpViewController.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


- (IBAction)signUp:(id)sender;
- (IBAction)cancelSignUp:(id)sender;


@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// SIGN UP AND CANCEL BUTTON ACTIONS

- (IBAction)signUp:(id)sender {
    NSString* name = [self.firstNameTF.text stringByAppendingString:@" "];
    name = [name stringByAppendingString:self.lastNameTF.text];
    name = [name lowercaseString];
    
    NSString* email = self.emailTF.text;
    email = [email lowercaseString];
    
    NSString* password = self.passwordTF.text;
    
    if(![email containsString:@"@my.fsu.edu"])       // invalid email
    {
        [self alertUserWithTitle:@"Error"
                         message:@"Only valid fsu emails may create a user account."
                     actionTitle:@"Ok"
                        exitView:NO];
        return;
    }
    else if(([self.firstNameTF.text length] == 0)
            || ([self.lastNameTF.text length] == 0))    // empty first and/or last name field
    {
        [self alertUserWithTitle:@"Error"
                         message:@"User accounts must have first and last names."
                     actionTitle:@"Ok"
                        exitView:NO];
        return;
    }
    else if([password length] == 0) {
        [self alertUserWithTitle:@"Error"
                         message:@"Password cannot be blank."
                     actionTitle:@"Ok"
                        exitView:NO];
        return;
    }
    
    // attempt to create user
    PFUser *user = [PFUser user];
    
    user.username = [email stringByReplacingOccurrencesOfString:@"@my.fsu.edu" withString:@""];
    user.email = email;
    user.password = password;
    [user setObject:name forKey:@"Name"];
    [user setObject:@" " forKey:@"website"];
    [user setObject:@" " forKey:@"hobbies"];
    [user setObject:@" " forKey:@"about"];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error) {
            // let user know account has been created successfully
            [self alertUserWithTitle:@"Success" message:@"User account created" actionTitle:@"Ok" exitView:YES];
        }
        else {
            // let user know account has not been created and why
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            errorString = [@"User account has not been created, because " stringByAppendingString:errorString];
            
            [self alertUserWithTitle:@"Error" message:errorString actionTitle:@"Ok" exitView:NO];
        }
    }];
    
}

- (IBAction)cancelSignUp:(id)sender {
    
    // go to previous view
    [self dismissViewControllerAnimated:YES completion:nil];

}

// ALERT USER

- (void)alertUserWithTitle: (NSString*) title
                   message: (NSString*) message
               actionTitle: (NSString*) actionT
                  exitView: (BOOL) exitV        // return to login page if true
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:actionT
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction* action) {
                                                              if(exitV) // return to login page
                                                                  [self dismissViewControllerAnimated:YES completion:nil];
                                                          }];
    // add action to alert and show to user
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
