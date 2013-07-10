//
//  DrawingViewController.h
//  LectureConnect
//
//  Created by student on 6/20/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DrawingCanvas.h"
#import "ALNetworkInterface.h"

@interface DrawingViewController : NSViewController <NetworkDataSource>
@property (strong) IBOutlet DrawingCanvas *canvas;

- (void)connectedToServer:(ALNetworkInterface *)server;

@end
