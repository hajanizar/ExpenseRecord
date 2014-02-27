//
//  monthlytableview.m
//  defaultCtegory
//
//  Created by BSA univ 5 on 20/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import "dailytableview.h"
#import "categoryTableViewController.h"
#import "ExpenseDetais.h"
#import "DefaultCategory.h"
int i=0;


@interface dailytableview ()


@end

@implementation dailytableview
{
    categoryTableViewController *catview;
}
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize expensearray;
@synthesize categoryarray;


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
    
    [self.tableView registerNib:[UINib nibWithNibName:@"EXCustomCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CustomCellReuseID"];
    
    
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    _managedObjectContext=[appdelegate managedObjectContext];
    NSFetchRequest *request =[[NSFetchRequest alloc]init];
    NSEntityDescription *exp =[NSEntityDescription entityForName:@"ExpenseDetais" inManagedObjectContext:_managedObjectContext];
    [request setEntity:exp];
    NSFetchRequest *request1 =[[NSFetchRequest alloc]init];
    NSEntityDescription *exp1 =[NSEntityDescription entityForName:@"DefaultCategory" inManagedObjectContext:_managedObjectContext];
    [request1 setEntity:exp1];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSError *error=nil;
    NSMutableArray *mutableFetchResult=[[_managedObjectContext executeFetchRequest:request error:&error]mutableCopy];
    NSMutableArray *mutableFetchResult1=[[_managedObjectContext executeFetchRequest:request1 error:&error]mutableCopy];
    
    if (mutableFetchResult==nil) {
        //handle error
    }
    [self setExpensearray:mutableFetchResult];
    
    
    [self setCategoryarray:mutableFetchResult1];
    
    
    NSLog(@"there are %u in the  expense array",[expensearray count]);
    NSLog(@"there are %u in the  category array",[categoryarray count]);
    
    NSLog(@"######load#########");
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    NSLog(@"===========table=============");
    
    
    return 1;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    NSString *name=[NSString stringWithFormat:@"Week %d",section+1];
//    return name;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"===========section=============");
    return [expensearray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"customcell");
    return [categoryarray count]*40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"===========view=============");
    
    static NSString *CellIdentifier = @"CustomCellReuseID";
    EXCustomCell *cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[EXCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setDateStyle:NSDateFormatterLongStyle];
  
    
    ExpenseDetais *expen=(ExpenseDetais *)[expensearray objectAtIndex:indexPath.row];
    
    i=i+1;
    NSData *data=[expen expenserecord];
    NSDictionary *dat=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    [dat allKeys];
    [dat allValues] ;
    NSMutableString *value=[[NSMutableString alloc]init];
    NSString *temp=[[NSString alloc]init];
    for (int i=0; i<[[dat allKeys]count]; i++) {
        temp=[NSString stringWithFormat:@"%@ Rs: %@\n",[[dat allKeys]objectAtIndex:i],[[dat allValues]objectAtIndex:i ]];
        value=[NSMutableString stringWithFormat:@"%@\n",[value stringByAppendingString:temp]];
        
        
        
    
    
    }
    

        [cell.cellItemLabel setText:[formatter stringFromDate:[expen date]]];
        
        [cell.expenView setText:[NSString stringWithFormat:@"%@",value]];
   
    
    //NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    
    
    //    NSLog(@"%@",  [dat allKeys]);
    //    NSLog(@"%@",  [dat allValues]);
    
    
    
    
    //[cell.amtLable setText:[NSString stringWithFormat:@"%@",[[dat allValues] objectAtIndex:0]]];
    
    
    
    return cell;
}





- (IBAction)bakbutton:(id)sender {
    categoryTableViewController *defaultCat=[[categoryTableViewController alloc]init];
    [self presentViewController:defaultCat animated:YES completion:Nil];

    
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end

