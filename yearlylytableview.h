//
//  yearlytableview.h
//  defaultCtegory
//
//  Created by BSA Univ4 on 24/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXCustomCell.h"

@interface monthlytableview : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *monthsTable;
}
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) NSMutableArray *monthsArray;


@end
