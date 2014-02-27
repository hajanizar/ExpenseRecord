//
// dailylytableview.h
//  defaultCtegory
//
//  Created by BSA univ 5 on 20/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXCustomCell.h"



@interface dailytableview : UITableViewController
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong) NSMutableArray *expensearray;
@property (nonatomic,strong) NSMutableArray *categoryarray;



@end
