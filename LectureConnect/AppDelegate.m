//
//  AppDelegate.m
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "AppDelegate.h"
#import "ALNetworkInterface.h"

@implementation AppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        _server = [[ALNetworkInterface alloc] init];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
}

@end
