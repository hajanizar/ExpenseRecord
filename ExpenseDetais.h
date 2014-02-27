//
//  ExpenseDetais.h
//  defaultCtegory
//
//  Created by Nomi on 2/13/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ExpenseDetais : NSManagedObject

@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSData * expenserecord;

@end
