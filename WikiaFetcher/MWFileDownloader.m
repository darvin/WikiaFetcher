//
//  MWImageDownloader.m
//  WikiaFetcher
//
//  Created by Sergey Klimov on 1/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MWFileDownloader.h"
#import "File.h"
#import "AFNetworking.h"

@implementation MWFileDownloader


-(id) init {
    if (self=[super init]) {
//        queue = [NSOperationQueue mainQueue];
    }
    return self;
}

-(void) addFile:(File*) file {
    
    //fixme don't do same job twice, call next url only if operation failed.
    for (NSURL* url in [file URLs]) {
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:url]];
        
        //    NSLog(@"%@", [file URL]);
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSData *resultData = responseObject;
            
            [resultData writeToFile:[file filename] atomically:YES];
            
        }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Cannot fetch %@", [[operation request] URL]);
             
             
         } ];
        
        [[NSOperationQueue mainQueue] addOperation:operation];

    }

}


@end
