//
//  categoryTableViewController.m
//  defaultCtegory
//
//  Created by Nomi on 2/10/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import "categoryTableViewController.h"

@interface categoryTableViewController ()
{
    AppDelegate *delegObj;
    DefaultCategory *defaultObj;
}
@end

@implementation categoryTableViewController
@synthesize expenseString,textFieldArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    textFieldArray = [[NSMutableArray alloc]init]; 
    
    delegObj=[[UIApplication sharedApplication]delegate];
    self.managedObjContext=delegObj.managedObjectContext;
    self.fetchingArry=[delegObj getAllFields];//saving all the category using fetchRequest in an array
    [self.tableView reloadData];
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_fetchingArry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UITextField *tf=nil;
    tf=expenseTextField=[self makeTextField:expenseString placeholder:@"Value"];//calling method for creating textfield
    expenseTextField.borderStyle=UITextBorderStyleRoundedRect;

    [cell addSubview:expenseTextField];
     [textFieldArray addObject:expenseTextField];

    tf.frame=CGRectMake(120, 12, 170, 30);
    [tf addTarget:self action:@selector(methodcall:) forControlEvents:UIControlEventEditingDidEndOnExit];
    //NSLog(@"ABCD%@", self.fetchingArry);
    defaultObj=[self.fetchingArry objectAtIndex:indexPath.row] ;
        cell.textLabel.text=[NSString stringWithFormat:@"%@", defaultObj.categoryName ];
    

    return cell;
}
-(IBAction)methodcall:(id)sender
{
    
}
-(UITextField *) makeTextField: (NSString *)text placeholder:(NSString *)placeholder
{
    UITextField* tf=[[UITextField alloc]init];
    tf.placeholder=placeholder;
    tf.text=text;
    tf.autocorrectionType=UITextAutocorrectionTypeNo;
    tf.autocapitalizationType=UITextAutocapitalizationTypeNone;
   // tf.textColor=[UIColor colorWithCGColor:(__bridge CGColorRef)([UIColor blueColor])];
    tf.textColor=[UIColor blueColor];
    return tf;
}
- (IBAction)saveBttnPressed:(id)sender {
    
    NSDate *Date=[[NSDate alloc]init]; //getting todays date
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
  //  NSLog(@"====>%@", defaultObj.categoryName);
   // NSLog(@"---------->%@",categoryTextField.text);
   // NSLog(@">>>>>>%@", categoryString);
    
    for (int i=0; i < [textFieldArray count]; i++) {
    
        UITextField * tt = [textFieldArray objectAtIndex:i];
        NSLog(@"%@",tt.text);
        defaultObj=[self.fetchingArry objectAtIndex:i] ;
       NSLog( @"%@",[NSString stringWithFormat:@"%@", defaultObj.categoryName ]);
        if ([tt.text isEqualToString:@""]) {
            tt.text=@"0.0";
        }
       
        [dict setValue:[NSString stringWithFormat:@"%@",tt.text] forKey:defaultObj.categoryName]; //assiging value
        tt.text = @"";
    }
    
   // [dict setValue:@"Something" forKey:@"Apple"];
  //  for (int i=0; i<=[_fetchingArry count]; i++) {
   //     [dict setValue:[NSString stringWithFormat:@"%@", categoryTextField.text] forKey:[self fetchingArry]];

    //[dict setValue:[NSString stringWithFormat:@"%@",categoryTextField.text] forKey:defaultObj.categoryName]; //assiging value

        NSLog(@"dict==> %@",dict);

 //   }
    
  

    ExpenseDetais *newObjectforExpense =[NSEntityDescription insertNewObjectForEntityForName:@"ExpenseDetais" inManagedObjectContext:self.managedObjContext];
    
 
    [newObjectforExpense setUid:@"pervez Nouman" ];
    [newObjectforExpense setDate:Date];
  
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    [newObjectforExpense setExpenserecord:data];

   // [newObjectforExpense setExpenserecord:<#(NSData *)#>]

 
    NSError *error=nil;
    
    if (![self.managedObjContext save:&error] ) {
        NSLog(@"Couldnt save %@", [error localizedDescription]);

    }
    expenseTextField.text=@"";
}
- (IBAction)backBttn:(id)sender {
   
    DefualtCategoryViewController *defaultCat=[[DefualtCategoryViewController alloc]init];
    [self presentViewController:defaultCat animated:YES completion:Nil];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.expenseString=expenseTextField.text;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
