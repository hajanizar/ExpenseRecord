//
//  month.h
//  defaultCtegory
//
//  Created by BSA Univ4 on 27/02/14.
//  Copyright (c) 2014 Nomi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface month : NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic) NSInteger year;

- (id)initWithName:(NSString *)name AndYear:(NSInteger)year;
- (NSString *)toString;


@end
