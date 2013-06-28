//
//  DrawingCanvas.m
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "DrawingCanvas.h"
#import "ALNetworkInterface.h"

#define BUFFERSIZE 1

@interface DrawingCanvas ()

@property (nonatomic, strong) NSBezierPath *path;

@end

@interface NSBezierPath ()

@property NSColor *color;

@end

@implementation DrawingCanvas

- (void)viewDidMoveToWindow
{
    _path = [[NSBezierPath alloc] init];
    [_path setLineWidth:3.0];
}

- (BOOL)acceptsFirstResponder {return YES;}

#pragma mark NetworkDataSource

- (CGSize)screenSize
{
    return self.frame.size;
}

#pragma mark Drawing

- (void)mouseDown:(NSEvent *)theEvent
{
    _app = [NSApplication sharedApplication].delegate;
    [_app.server sendMoveToPoint:theEvent.locationInWindow];
    [_path moveToPoint:[theEvent locationInWindow]];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    [_app.server sendLineToPoint:theEvent.locationInWindow];
    [_path lineToPoint:[theEvent locationInWindow]];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)theEvent
{
      
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor whiteColor] set];
    NSRectFill(dirtyRect);
    [[NSColor blueColor] set];
    [_path stroke];
}

@end
