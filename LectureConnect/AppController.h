//
//  AppController.h
//  LectureConnect
//
//  Created by student on 6/20/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawingViewController.h"

@interface AppController : NSObject <NSWindowDelegate>
@property (weak) IBOutlet NSButton *clearButton;
@property (nonatomic, strong) IBOutlet NSView *canvas;
@property (weak) IBOutlet NSTextField *connectionURL;
@property (weak) IBOutlet NSTextField *requestName;
@property (retain) IBOutlet NSWindow *connectWindow;
@property (retain) IBOutlet NSWindow *drawingWindow;

- (IBAction)quitApp:(id)sender;

- (IBAction)connect:(id)sender;

@end
