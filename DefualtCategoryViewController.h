//
//  DefualtCategoryViewController.h
//  defaultCtegory
//
//  Created by Nomi on 2/10/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DefaultCategory.h"

@interface DefualtCategoryViewController : UIViewController
@property (retain, nonatomic) NSManagedObjectContext *managedObjContext;
@property (weak, nonatomic) IBOutlet UIButton *yearlyviewbutton;

@end
