//
//  EditProfileViewController.m
//  iOS-Course
//
//  Created by Lukas Carvajal on 6/25/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "EditProfileViewController.h"
#import <Parse/Parse.h>
#import "User.h"

@interface EditProfileViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *picIV;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *websiteTF;
@property (weak, nonatomic) IBOutlet UITextField *hobbiesTF;
@property (weak, nonatomic) IBOutlet UITextView *aboutTV;

- (IBAction)uploadPhoto:(id)sender;

- (IBAction)saveProfile:(id)sender;

- (IBAction)revertProfile:(id)sender;

- (void)logOut;

@end

@implementation EditProfileViewController

-(void) viewWillAppear:(BOOL)animated {
    
    // hide navigation bar
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.navigationItem.hidesBackButton = YES;
    self.tabBarController.navigationItem.title = @"My Profile";
    
    ;}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_currentUser)
        _currentUser = [[User alloc] init];
    
    if (!_imageToUpload)
        _imageToUpload = [[UIImage alloc] init];
    
    
    // add log out button
    UIBarButtonItem *logOut = [[UIBarButtonItem alloc]
                               initWithTitle:@"Log out"
                               style:UIBarButtonItemStylePlain
                               target:self
                               action:@selector(logOut)];
    self.tabBarController.navigationItem.rightBarButtonItem = logOut;
    
    // load current user info
    [self loadProfile];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// SET IMAGE VIEW AND TEXT FIELDS FOR USER

- (void)loadProfile {
    
    // get current user info
    [self.currentUser setCurrentUser];

    //  show current user info in edit profile window
    PFFile *userImageFile = [[PFUser currentUser] objectForKey:@"profilePic"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.picIV.image = [UIImage imageWithData:imageData];
        }
        else {
            NSLog(@"profile photo not found!");
        }
    }];
    
    // check if string only contains white space
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    self.nameTF.text = self.currentUser.name;
    self.usernameTF.text = self.currentUser.username;
    if([[self.currentUser.website stringByTrimmingCharactersInSet: set] length] != 0)
        self.websiteTF.text = self.currentUser.website;
    if([[self.currentUser.hobbies stringByTrimmingCharactersInSet: set] length] != 0)
        self.hobbiesTF.text = self.currentUser.hobbies;
    self.aboutTV.text = self.currentUser.about;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)uploadPhoto:(id)sender {
    //Open a UIImagePickerController to select the picture
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self.navigationController presentViewController:imgPicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)img
                  editingInfo:(NSDictionary *)editInfo {
    
    self.picIV.image = img;
    self.imageToUpload = img;
    
    [picker dismissModalViewControllerAnimated:YES];
}

- (IBAction)saveProfile:(id)sender {
    NSString* newName = self.nameTF.text;
    newName = [newName capitalizedString];
    NSString* newWebsite = self.websiteTF.text;
    NSString* newHobbies = self.hobbiesTF.text;
    NSString* newAbout = self.aboutTV.text;
    
    if([newName length] == 0) {
        // alert
        return;
    }
    else {
        PFObject* cUser = [PFUser currentUser];
        cUser[@"Name"] = newName;
        cUser[@"website"] = newWebsite;
        cUser[@"hobbies"] = newHobbies;
        cUser[@"about"] = newAbout;
        
        NSData* data = UIImagePNGRepresentation(self.imageToUpload);
        PFFile *imageFile = [PFFile fileWithName:@"image.png" data:data];
        cUser[@"profilePic"] = imageFile;
        
        [cUser saveInBackground];
    }
}

- (IBAction)revertProfile:(id)sender {
    [self loadProfile]; // reload profile from user
}

- (void)logOut {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
