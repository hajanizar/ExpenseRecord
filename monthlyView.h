//
//  monthlyView.h
//  defaultCtegory
//
//  Created by BSA Univ4 on 27/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXCustomCell.h"

@interface monthlyView : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *monthsTable;
}

@property (nonatomic, retain) NSMutableArray *monthsArray;
//@property (nonatomic,strong) NSMutableArray *expensearray;
@property (nonatomic,strong) NSMutableArray *categoryarray;
//

-(void)viewMonthExpenses;



@end
