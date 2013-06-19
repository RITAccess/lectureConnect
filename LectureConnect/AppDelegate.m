//
//  AppDelegate.m
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Connect to server
    _server = [[ALNetworkInterface alloc] initWithURL:[NSURL URLWithString:@"students-imac.wireless.rit.edu"]];
    [_server connect];
}

@end
