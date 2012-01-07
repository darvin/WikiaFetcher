//
//  MWImageDownloader.h
//  WikiaFetcher
//
//  Created by Sergey Klimov on 1/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "File.h"
@interface MWFileDownloader : NSObject {
//    NSOperationQueue *queue;
}
-(void) addFile:(File*) file;
@end
