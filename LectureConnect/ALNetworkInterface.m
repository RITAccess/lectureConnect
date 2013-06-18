//
//  ALNetworkInterface.m
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "ALNetworkInterface.h"

@interface ALNetworkInterface ()

@end

@implementation ALNetworkInterface

- (id)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        _connectionURL = url;
    }
    return self;
}


@end
