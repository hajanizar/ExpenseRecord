//
//  logIn.m
//  ExpenseRecorder
//
//  Created by Nomi on 2/7/14.
//  Copyright (c) 2014 c. All rights reserved.
//

#import "logIn.h"
#import "GTMOAuth2ViewControllerTouch.h"
#import "GTLDrive.h"

static NSString *const kKeychainItemName = @"iOSDriveSample: Google Drive";
static NSString *const kClientId = @"827309469268-o9lb87hcr8594begvtd4qiopvass61oh.apps.googleusercontent.com";
static NSString *const kClientSecret = @"__ZVfRMSNqhNJHo7nZSDIFzL";


@interface logIn ()

@end

@implementation logIn

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    GTMOAuth2Authentication *auth =
    [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:kKeychainItemName
                                                          clientID:kClientId
                                                      clientSecret:kClientSecret];
    if ([auth canAuthorize]) {
        [self isAuthorizedWithAuthentication:auth];
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOut:(id)sender {
    
    [GTMOAuth2ViewControllerTouch removeAuthFromKeychainForName:kKeychainItemName];
    [[self driveService] setAuthorizer:nil];
    
    self.isAuthorized=NO;
    NSLog(@"LogOUT%hhd", self.isAuthorized);
}

- (IBAction)signIn:(id)sender {

  
   if (!self.isAuthorized) {
        // Sign in.
       
        SEL finishedSelector = @selector(viewController:finishedWithAuth:error:);
        GTMOAuth2ViewControllerTouch *authViewController =
        [[GTMOAuth2ViewControllerTouch alloc] initWithScope:kGTLAuthScopeDrive
                                                   clientID:kClientId
                                               clientSecret:kClientSecret
                                           keychainItemName:kKeychainItemName
                                                   delegate:self
                                           finishedSelector:finishedSelector];
        [self presentViewController:authViewController animated:YES completion:^(void){}];
       
    }
   
}
- (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuth2Authentication *)auth
                 error:(NSError *)error {
    
    NSLog(@"Received error %@ and auth object %@",error, auth);
    
    [self dismissViewControllerAnimated:YES completion:^(void){}];
    if (error == nil) {
        [self isAuthorizedWithAuthentication:auth];
    }
}
- (void)isAuthorizedWithAuthentication:(GTMOAuth2Authentication *)auth {
    [[self driveService] setAuthorizer:auth];
    self.isAuthorized = YES;
    NSLog(@"Received Access Token 2");
    
    NSLog(@"Received Access Token:%@",auth);
    [self userinfo];
    //  NSLog(@"%@", signIn.authentication.userEmail);
    
    // NSLog(@"user google user id  %@",signIn.userEmail);
}
- (GTLServiceDrive *)driveService {
    static GTLServiceDrive *service = nil;
    
    if (!service) {
        service = [[GTLServiceDrive alloc] init];
        
        // Have the service object set tickets to fetch consecutive pages
        // of the feed so we do not need to manually fetch them.
        service.shouldFetchNextPages = YES;
        
        // Have the service object set tickets to retry temporary error conditions
        // automatically.
        service.retryEnabled = YES;
    }
    return service;
}
- (IBAction)moveToHome:(id)sender {
    NSLog(@"--------%hhd", self.isAuthorized);
    if (self.isAuthorized==true) {
        categoryTableViewController *saveObj1=[[categoryTableViewController alloc]init];
        [self presentViewController:saveObj1 animated:YES completion:Nil];
    }
    NSLog(@"LOGIN PLEASE");
}

-(void)userinfo
{
    NSString *temp=@"https://www.googleapis.com/plus/v1/people/me";
    fetcher = [self.driveService.fetcherService fetcherWithURLString:temp];
    
    GTMOAuth2Authentication *tempobj = fetcher.authorizer;
    NSLog(@"====%@", [tempobj.parameters valueForKey:@"email"]);
    
    
    
}
@end





