//
//  monthlyView.m
//  defaultCtegory
//
//  Created by BSA Univ4 on 27/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import "monthlyView.h"
#import "month.h"
#import "categoryTableViewController.h"
//#import "ExpenseDetais.h"
//#import "DefaultCategory.h"
@interface monthlyView ()

@end

@implementation monthlyView
//{
//    categoryTableViewController *catview;
//}
@synthesize monthsArray;
//@synthesize expensearray;
@synthesize categoryarray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        NSLog(@"Executing initWithNibName");
        
        NSMutableArray *monthNames = [[NSMutableArray alloc] initWithObjects:@"January", @"February", @"March", @"April",
                                      @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December",
                                      nil];
        
        int currentYear = 2012;
        month *m;
        
        self.monthsArray = [[NSMutableArray alloc] initWithObjects:nil];
        
        while (currentYear >= 2014) {
            for (int i = 0; i < monthNames.count; i++) {
                m = [[month alloc] initWithName:[monthNames objectAtIndex:i] AndYear:currentYear];
                [self.monthsArray addObject:m];
            }
            currentYear--;
        }
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Select Month"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    monthsTable = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 return [self.monthsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EXCustomCell *cell = [monthsTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[EXCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    month *m = [self.monthsArray objectAtIndex:[indexPath row]];
    
    [cell.textLabel setText:[m toString]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"customcell");
//    return [categoryarray count]*40;
//}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
