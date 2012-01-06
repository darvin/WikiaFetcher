//
//  MWXMLParser.h
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MWXMLParser;

@protocol MWXMLParserDelegate <NSObject>
-(void) parserDidEndDocument:(MWXMLParser*) parser;
@optional
-(void) parser:(MWXMLParser*) parser pageProcessingStarted: (NSString*) pageTitle;

@end

@interface MWXMLParser : NSObject <NSXMLParserDelegate>
{
    NSDateFormatter *dateFormatter;
}
@property (retain) NSMutableString* currentString;
@property (retain) NSMutableDictionary* currentPage;
@property (retain) NSString* currentElement;
@property (assign) NSObject<MWXMLParserDelegate>* delegate;
@end
