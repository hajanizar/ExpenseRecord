//
//  month.m
//  defaultCtegory
//
//  Created by BSA Univ4 on 27/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import "month.h"

@implementation month
@synthesize name, year;

- (id)initWithName:(NSString *)_name AndYear:(NSInteger)_year
{
    self.name = _name;
    self.year = _year;
    
    return self;
}

- (NSString *)toString
{
    NSString *s = [[NSString alloc] init];
    s = [s stringByAppendingString:self.name];
    s = [s stringByAppendingString:@" "];
    s = [s stringByAppendingString:[NSString stringWithFormat:@"%i", self.year]];
    
    return s;
}

@end
