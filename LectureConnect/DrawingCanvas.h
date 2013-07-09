//
//  DrawingCanvas.h
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ALNetworkInterface.h"
#import "AppDelegate.h"

@interface DrawingCanvas : NSView <NetworkDataSource>

@property (nonatomic, strong) AppDelegate *app;

- (NSImage *)getCurrentImage;

@end
