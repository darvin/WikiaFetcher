//
//  Page.h
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Namespace;

@interface Page : NSManagedObject
{
    NSString* regexFormat;
    NSString* categoriesRegex;
    NSString* filesRegex;
}
 
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * revisionDate;
@property (nonatomic, retain) NSSet *categories;
@property (nonatomic, retain) Namespace *namespace;
@property (nonatomic, retain) NSSet *files;
@property (nonatomic, retain) NSManagedObject *contributor;
@property (nonatomic, retain) NSManagedObject *wiki;

@end

@interface Page (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(NSManagedObject *)value;
- (void)removeCategoriesObject:(NSManagedObject *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

- (void)addFilesObject:(NSManagedObject *)value;
- (void)removeFilesObject:(NSManagedObject *)value;
- (void)addFiles:(NSSet *)values;
- (void)removeFiles:(NSSet *)values;


@end
