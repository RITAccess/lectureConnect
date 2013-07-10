//
//  AppController.m
//  LectureConnect
//  Created by student on 6/20/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "AppController.h"
#import "AppDelegate.h"
#import "ALNetworkInterface.h"

@implementation AppController
{
    DrawingViewController *drawController;
}

- (void)awakeFromNib
{
    drawController = [[DrawingViewController alloc] initWithNibName:@"DrawingViewController" bundle:nil];
    [_canvas addSubview:drawController.view];
}

#pragma mark Stream Setup

- (IBAction)connect:(id)sender
{
    AppDelegate *app = [[NSApplication sharedApplication] delegate];
    ALNetworkInterface *server = app.server;
    [server setLecture:_requestName.stringValue];
    [server connectWithURL:[NSURL URLWithString:_connectionURL.stringValue] completetion:^(BOOL completed) {
        if (completed) {
            [_connectWindow close];
            [_drawingWindow makeKeyAndOrderFront:_drawingWindow];
            [drawController connectedToServer:server];
        } else {
            NSLog(@"Failed to connect");
        }
    }];
}

#pragma mark System

- (IBAction)quitApp:(id)sender
{
    [NSApp terminate:nil];
}

@end
