//
//  yearlytableview.m
//  defaultCtegory
//
//  Created by BSA Univ4 on 24/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import "yearlytableview.h"
#import "categoryTableViewController.h"
#import "ExpenseDetais.h"
#import "DefaultCategory.h"

int j=0;

@interface yearlytableview ()

@end

@implementation yearlytableview
{
    DefualtCategoryViewController *def;
}
@synthesize managedObjectContext = _managedObjectContext;
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
//    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
//    _managedObjectContext=[appdelegate managedObjectContext];
//    NSFetchRequest *request =[[NSFetchRequest alloc]init];
//    NSEntityDescription *exp =[NSEntityDescription entityForName:@"ExpenseDetais" inManagedObjectContext:_managedObjectContext];
//    [request setEntity:exp];
//    NSFetchRequest *request1 =[[NSFetchRequest alloc]init];
//    NSEntityDescription *exp1 =[NSEntityDescription entityForName:@"DefaultCategory" inManagedObjectContext:_managedObjectContext];
//    [request1 setEntity:exp1];
//

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    NSError *error=nil;
//    NSMutableArray *mutableFetchResult=[[_managedObjectContext executeFetchRequest:request error:&error]mutableCopy];
//    NSMutableArray *mutableFetchResult1=[[_managedObjectContext executeFetchRequest:request1 error:&error]mutableCopy];
//    
//    if (mutableFetchResult==nil) {
//        //handle error
//    }
//    [self setExpensearray:mutableFetchResult];
//    
//    
//    [self setCategoryarray:mutableFetchResult1];
//    
//    
//    NSLog(@"there are %u in the  expense array",[expensearray count]);
//    NSLog(@"there are %u in the  category array",[categoryarray count]);
//    
//    NSLog(@"######load#########");
//    
//    

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 12;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *year;
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    
    switch (section) {
        case 0: year=@"January";
                        NSDateComponents *com1=[[NSDateComponents alloc] init];
                        [com1 setYear:2014];
                        [com1 setMonth:02];
                        [com1 setDay:1];
                         NSDate *startDate = [gregorianCalendar dateFromComponents:com1];
                        [com1 setYear:2016];
                        [com1 setMonth:02];
                        [com1 setDay:31];
                        NSDate *endDate = [gregorianCalendar dateFromComponents:com1];
                        NSFetchRequest *jan= [self filteredFetchRequestForEntity:@"ExpenseDetais" startDate:startDate endDate:endDate];
            break;
//      case 1: year=@"February";break;
//        case 2:year=@"March";break;
//        case 3:year=@"April";break;
//        case 4:year=@"May";break;
//        case 5:year=@"June";break;
//        case 6:year=@"July";break;
//        case 7:year=@"August";break;
//       case 8:year=@"September";break;
//        case 9:year=@"October";break;
//        case 10:year=@"November";break;
//        case 11:year=@"December";break;
//        default:break;
    }
    return year;
}

    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
     EXCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
       if (cell == nil) {
        cell = [[EXCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
}
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//	[formatter setDateStyle:NSDateFormatterLongStyle];
//    // Configure the cell...
//    
//    ExpenseDetais *expen=(ExpenseDetais *)[expensearray objectAtIndex:indexPath.row];
//    
//    i=i+1;
//    NSData *data=[expen expenserecord];
//    NSDictionary *dat=[NSKeyedUnarchiver unarchiveObjectWithData:data];
//    [dat allKeys];
//    [dat allValues] ;
//    NSMutableString *value=[[NSMutableString alloc]init];
//    NSString *temp=[[NSString alloc]init];
//    for (int i=0; i<[[dat allKeys]count]; i++)
//    {
//        temp=[NSString stringWithFormat:@"%@ Rs: %@\n",[[dat allKeys]objectAtIndex:i],[[dat allValues]objectAtIndex:i ]];
//        value=[NSMutableString stringWithFormat:@"%@\n",[value stringByAppendingString:temp]];
//        
//    }
//    
//    
//    [cell.cellItemLabel setText:[formatter stringFromDate:[expen date]]];
//    
//    [cell.expenView setText:[NSString stringWithFormat:@"%@",value]];
//    
//        
//        

    return cell;
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
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

- (IBAction)bakbutton:(id)sender
{
    def=[[DefualtCategoryViewController alloc]init];
    [self presentViewController:def animated:YES completion:nil];
}


- (NSFetchRequest *)filteredFetchRequestForEntity:(NSString *)entityName startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
   // [NSPredicate predicateWithFormat:@"dateOfEvent > %@ && dateOfEvent <= %@", startOfYear, endOfYear];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date >= %@) AND (date <= %@", startDate, endDate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    return fetchRequest;
}


@end
