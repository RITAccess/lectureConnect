//
//  DrawingCanvas.m
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "DrawingCanvas.h"
#import "BufferObject.h"
#import "AppDelegate.h"

@interface DrawingCanvas ()

@property (nonatomic, strong) NSBezierPath *path;

@end

@implementation DrawingCanvas {
    AppDelegate *app;
    BufferObject *buffer;
}

- (void)viewDidMoveToWindow
{
    _path = [[NSBezierPath alloc] init];
    [_path setLineWidth:3.0];
}

- (BOOL)acceptsFirstResponder {return YES;}

- (void)mouseDown:(NSEvent *)theEvent
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       app = [NSApplication sharedApplication].delegate; 
    });
    buffer = [[BufferObject alloc] init];
    [_path moveToPoint:[theEvent locationInWindow]];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    [_path lineToPoint:[theEvent locationInWindow]];
    [buffer addChange:[theEvent locationInWindow]];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)theEvent
{
    NSLog(@"Mouse up");
    [app.server sendUpdate:buffer];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor whiteColor] set];
    NSRectFill(dirtyRect);
    [[NSColor blueColor] set];
    [_path stroke];
}

@end
