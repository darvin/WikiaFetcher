//
//  Namespace.h
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Namespace : NSManagedObject
 
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *pages;
@end

@interface Namespace (CoreDataGeneratedAccessors)

- (void)addPagesObject:(NSManagedObject *)value;
- (void)removePagesObject:(NSManagedObject *)value;
- (void)addPages:(NSSet *)values;
- (void)removePages:(NSSet *)values;

@end
