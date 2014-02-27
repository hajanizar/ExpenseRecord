//
//  DefualtCategoryViewController.m
//  defaultCtegory
//
//  Created by Nomi on 2/10/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import "DefualtCategoryViewController.h"
#import "categoryTableViewController.h"
#import "dailytableview.h"
#import "monthlyView.h"

@interface DefualtCategoryViewController ()
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UITextField *categoryTextFiled;

@end

@implementation DefualtCategoryViewController
{
    categoryTableViewController *tabObj;
    dailytableview *daily;
    monthlyView *month;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
        AppDelegate *appObj=[[UIApplication sharedApplication]delegate];// calling app delegate

    self.managedObjContext=appObj.managedObjectContext; //assiging managedObjContext of app delegate to this class managedObjcontext
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveClicked:(id)sender {
    
    //defaultCategory is modal,
    //crating obj and and insert value to managedObjectContext of default Category
    DefaultCategory *DefaultCateObj=[NSEntityDescription insertNewObjectForEntityForName:@"DefaultCategory" inManagedObjectContext:self.managedObjContext];
 
    //assigning value from text field to categoryName String of defaultCateObj
    DefaultCateObj.categoryName=self.categoryTextFiled.text;
    
 //   [_managedObjContext setValue:[NSKeyedArchiver archivedDataWithRootObject:defaultModelObj.categoryArray] forKey:@"categoryArray"];
    NSLog(@"Value %@====", _managedObjContext);

    
    NSError *error=nil;
    
    if (![self.managedObjContext save:&error] ) {
        NSLog(@"Couldnt save %@", [error localizedDescription]);
        
        
        [self.view endEditing:YES];
    }
    tabObj=[[categoryTableViewController alloc]init];
    [self presentViewController:tabObj animated:YES completion:Nil];

}
- (IBAction)tableViewNavigate:(id)sender {
    tabObj=[[categoryTableViewController alloc]init];
    [self presentViewController:tabObj animated:YES completion:nil];

}
- (IBAction)epenview:(id)sender {
    daily=[[dailytableview alloc]init];
    [self presentViewController:daily animated:YES completion:nil];
}
- (IBAction)monthlyviewbutton:(id)sender
{
    month=[[monthlyView alloc]init];
    [self presentViewController:month animated:YES completion:nil];
}
- (IBAction)cancelBttn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

@end




