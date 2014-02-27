//
//  logIn.h
//  ExpenseRecorder
//
//  Created by Nomi on 2/7/14.
//  Copyright (c) 2014 c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMHTTPFetcher.h"
#import "categoryTableViewController.h"
@interface logIn : UIViewController
{
    GTMHTTPFetcher *fetcher;
    
}

- (IBAction)signOut:(id)sender;
- (IBAction)signIn:(id)sender;
@property BOOL isAuthorized;

@end
