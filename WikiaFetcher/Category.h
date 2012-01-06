//
//  Category.h
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Page.h"

@class Page;
 
@interface Category : Page

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *pages;
@end

@interface Category (CoreDataGeneratedAccessors)

- (void)addPagesObject:(Page *)value;
- (void)removePagesObject:(Page *)value;
- (void)addPages:(NSSet *)values;
- (void)removePages:(NSSet *)values;

@end
