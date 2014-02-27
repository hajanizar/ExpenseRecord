//
//  categoryTableViewController.h
//  defaultCtegory
//
//  Created by Nomi on 2/10/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DefaultCategory.h"
#import "ExpenseDetais.h"
#import <CoreData/CoreData.h>
#import "DefualtCategoryViewController.h"


@interface categoryTableViewController : UITableViewController<UITextFieldDelegate>
{
    NSString *CategroyString;// string for Categorytextfield
    UITextField *expenseTextField; // for expense text field inside tableview
    NSMutableArray *textFieldArray;// created to store all the text field to be in a array
}
@property(strong,nonatomic) NSMutableArray *textFieldArray;
@property (strong, nonatomic)NSArray *fetchingArry; // for getting whole category inside array
@property (strong, nonatomic)NSString *expenseString;
@property (strong, nonatomic) NSArray *saveArray; // to save value of all text fields through an array
@property (strong, nonatomic) NSManagedObjectContext *managedObjContext;


@end
