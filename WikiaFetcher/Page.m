//
//  Page.m
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Page.h"
#import "Namespace.h"
#import "RegexKitLite.h"
#import "Category.h"
#import "File.h"
@implementation Page

@dynamic text;
@dynamic title;
@dynamic revisionDate;
@dynamic categories;
@dynamic namespace;
@dynamic files;
@dynamic contributor;
@dynamic wiki;

- (id) initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context {
    if (self=[super initWithEntity:entity insertIntoManagedObjectContext:context]) {
        regexFormat = @"\\[\\[%@:([^\\|\\[\\]]*)\\|?[^\\[\\]]*\\]\\]";
        categoriesRegex = [NSString stringWithFormat:regexFormat, @"Category"];
        filesRegex = [NSString stringWithFormat:regexFormat, @"File"];
    }
    return self;
}

- (void) findRegexp:(NSString*)regExp andAddEntityClass:(Class)class byAttribute:(NSString*)attribute withSelector:(SEL)selector {
    NSAssert([self respondsToSelector:selector], @"Invalid selector"); 

    NSAssert([class respondsToSelector:@selector(MR_findFirstByAttribute:withValue:)], @"Invalid entity class");
    for (NSArray* match in [self.text arrayOfCaptureComponentsMatchedByRegex:regExp]) {
        NSString* attributeValue = [match objectAtIndex:1];
        id entity = [class MR_findFirstByAttribute:attribute withValue:attributeValue];
        if (!entity) {
            entity = [class MR_createEntity];
            [entity setValue:attributeValue forKey:attribute];
        }
        [self performSelector:selector withObject:entity];

    }
}

- (void)setText:(NSString *)newText
{
    [self willChangeValueForKey:@"text"];
    [self setPrimitiveText:newText];
    
    

    [self findRegexp:categoriesRegex andAddEntityClass:[Category class] byAttribute:@"title" withSelector:@selector(addCategoriesObject:)];
    
    [self findRegexp:filesRegex andAddEntityClass:[File class] byAttribute:@"name" withSelector:@selector(addFilesObject:)];
    
    [self didChangeValueForKey:@"text"];
    
    
}




@end
