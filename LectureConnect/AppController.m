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

- (void)awakeFromNib
{
    DrawingViewController *drawController = [[DrawingViewController alloc] initWithNibName:@"DrawingViewController" bundle:nil];
    [_canvas addSubview:drawController.view];
}

#pragma mark Stream Setup

- (IBAction)connect:(id)sender
{
    AppDelegate *app = [[NSApplication sharedApplication] delegate];
    ALNetworkInterface *server = app.server;
    // server = [[ALNetworkInterface alloc] initWithURL:[NSURL URLWithString:_connectionURL.stringValue]];
    [server setLecture:_requestName.stringValue];
//    [_connectWindow close];
//    [_drawingWindow makeKeyAndOrderFront:_drawingWindow];
    [server connectWithURL:[NSURL URLWithString:[_connectionURL stringValue]]];
    
    NSImage *image = [NSImage imageNamed:@"IMG_1705.JPG"];
    
    [server sendImage:image];
    
}

#pragma mark System

- (IBAction)quitApp:(id)sender
{
    [NSApp terminate:nil];
}

@end
