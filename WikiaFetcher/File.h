//
//  Image.h
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 26.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Page;

@interface File : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *page;
@end

@interface File (CoreDataGeneratedAccessors)

- (void)addPageObject:(Page *)value;
- (void)removePageObject:(Page *)value;
- (void)addPage:(NSSet *)values;
- (void)removePage:(NSSet *)values;

@end
