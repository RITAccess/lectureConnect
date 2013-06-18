//
//  DrawingCanvas.m
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "DrawingCanvas.h"

@interface DrawingCanvas ()

@property (nonatomic, strong) NSBezierPath *path;

@end

@implementation DrawingCanvas

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    return self;
}

- (void)viewDidMoveToWindow
{
    _path = [[NSBezierPath alloc] init];
    [_path setLineWidth:3.0];
}

- (BOOL)acceptsFirstResponder {return YES;}

- (void)mouseDown:(NSEvent *)theEvent
{
    [_path moveToPoint:[theEvent locationInWindow]];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    [_path lineToPoint:[theEvent locationInWindow]];
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor whiteColor] set];
    NSRectFill(dirtyRect);
    [[NSColor blueColor] set];
    [_path stroke];
}

@end
