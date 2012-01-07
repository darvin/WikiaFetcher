//
//  Wiki.h
//  WikiaFetcher
//
//  Created by Sergey Klimov on 1/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Page;

@interface Wiki : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * icon;
@property (nonatomic, retain) NSSet *pages;
@end

@interface Wiki (CoreDataGeneratedAccessors)

- (void)addPagesObject:(Page *)value;
- (void)removePagesObject:(Page *)value;
- (void)addPages:(NSSet *)values;
- (void)removePages:(NSSet *)values;


-(NSURL *) URL;

@end
