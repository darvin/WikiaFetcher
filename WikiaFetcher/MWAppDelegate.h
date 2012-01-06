//
//  MWAppDelegate.h
//  WikiaFetcher
//
//  Created by Sergey Klimov on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MWXMLParser.h"


@interface MWAppDelegate : NSObject <NSApplicationDelegate, MWXMLParserDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *wikiName;
@property (assign) IBOutlet NSTextField *currentPage;
@property (assign) IBOutlet NSProgressIndicator *progress;


@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@property (strong) MWXMLParser *mwParser;
@property (strong) NSXMLParser *xmlParser;



- (IBAction)saveAction:(id)sender;
- (IBAction)fetchAction:(id)sender;

@end
