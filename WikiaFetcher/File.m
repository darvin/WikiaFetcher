//
//  Image.m
//  MWCoreDataImporter
//
//  Created by Sergey Klimov on 26.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "File.h"
#import "Page.h"
#import "Wiki.h"

NSString * const FILENAME_PREFIX = @"!Wiki_file_";
#import "NSString+MD5.h"


@implementation File

@dynamic name;
@dynamic pages;

-(NSArray *) URLs {
    NSString* nameHash = [self.normalizedName MD5String];

    //very bad fixme
    
    NSArray *formats = [NSArray arrayWithObjects:@"http://images.wikia.com/%@/images/%@/%@/%@",@"http://images.wikia.com/%@/en/images/%@/%@/%@", nil];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[formats count]];
    for (NSString* format in formats) {
        
        [result addObject:[NSURL URLWithString:[NSString stringWithFormat:format, ((Wiki*)((Page*)[self.pages anyObject]).wiki).name, 
                                               [nameHash substringToIndex:1],
                                               [nameHash substringToIndex:2],
                                               self.normalizedName]] ];
    }
    
    return result;
}
-(NSString *) filename {
    return @"bla.png";
}

-(NSString *) normalizedName{
    NSString* result = [self.name stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    //very bad fix me
    NSCharacterSet *validCharacters = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_.-"];

    return [[result componentsSeparatedByCharactersInSet:[validCharacters invertedSet]] componentsJoinedByString:@""];
}


@end
