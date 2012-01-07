//
//  Wiki.m
//  WikiaFetcher
//
//  Created by Sergey Klimov on 1/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Wiki.h"
#import "Page.h"


@implementation Wiki

@dynamic name;
@dynamic icon;
@dynamic pages;


-(NSURL *) URL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://%@.wikia.com", self.name]];
}
@end
