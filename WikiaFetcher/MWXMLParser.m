//
//  MWXMLParser.m
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MWXMLParser.h"
#import "Namespace.h"
#import "Page.h"
#import "Contibutor.h"
#import "File.h"
#import "Category.h"
#import "MWFileDownloader.h"

@implementation MWXMLParser
@synthesize currentString, currentPage, currentElement, delegate=_delegate;

- (void) writePage {
    
    
    NSArray *namespaceAndTitle = [[self.currentPage objectForKey:@"title"] componentsSeparatedByString:@":"];
    NSString *namespaceName, *title;
    title = [namespaceAndTitle lastObject];
    
    [self.delegate parser:self pageProcessingStarted:title];
    
    if ([namespaceAndTitle count]==2) {
        namespaceName = [namespaceAndTitle objectAtIndex:0];
    } else {
        namespaceName = nil;
    }
    
    
    Page* newPage = [Page MR_findFirstByAttribute:@"title" withValue:title];
    if (!newPage) {
        newPage = [Page MR_createEntity];
        newPage.title = title;
    }
    
    newPage.wiki = wiki;
    
    newPage.text = [self.currentPage objectForKey:@"text"];
    
    Contibutor *contributor = [Contibutor MR_findFirstByAttribute:@"name" withValue:[self.currentPage objectForKey:@"username"]];
    if (!contributor&&[self.currentPage objectForKey:@"username"]) {
        contributor = [Contibutor MR_createEntity];
        contributor.name = [self.currentPage objectForKey:@"username"];
    }
    newPage.contributor = contributor;
    
    if (namespaceName) {
        Namespace *namespace = [Namespace MR_findFirstByAttribute:@"title" withValue:namespaceName];
        if (!namespace) {
            namespace = [Namespace MR_createEntity];
            namespace.title = namespaceName;
        }
        newPage.namespace = namespace;
    }
    
    newPage.revisionDate = [dateFormatter dateFromString: [self.currentPage objectForKey:@"timestamp"]];
    
    for (File* file in newPage.files) {
        [downloader addFile: file];
    }
    
//    NSLog(@"%@ , %@     %@", newPage.revisionDate, [self.currentPage objectForKey:@"timestamp"],[dateFormatter stringFromDate: [NSDate dateWithTimeIntervalSinceNow:0]]);
    
    
}

- (id) initWithWiki:(Wiki*) aWiki {	
	if (self=[super init]){
        self.currentString = [[NSMutableString alloc] init ];
        wiki = aWiki;
        dateFormatter = [[NSDateFormatter alloc] init]; 
        downloader = [[MWFileDownloader alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    }
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
    self.currentElement = elementName;
    [self.currentString setString:@""];
    if ([elementName isEqualToString:@"page"])
        self.currentPage = [NSMutableDictionary dictionary];
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if (self.currentPage)
        for (NSString* pageAttribute in [NSArray arrayWithObjects:@"title", @"username", @"text", @"timestamp", nil]) {
            if([elementName isEqualToString:pageAttribute]) {		
                [self.currentPage setObject:[NSString stringWithString: self.currentString] forKey:pageAttribute];
            }
        }
    if ([elementName isEqualToString:@"page"]) {
        [self writePage];
        self.currentPage = nil;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [self.currentString appendString:string];
}
- (void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString {
    if ([self.currentElement isEqualToString:@"text"])
        [self.currentString appendString:whitespaceString];
}

- (void) parserDidEndDocument:(NSXMLParser *)parser {
    [self.delegate parserDidEndDocument:self];
}
-(void) dealloc {
    [self.currentString release];
    [dateFormatter release];
    self.currentPage = nil;
    self.currentElement = nil;
}
@end
