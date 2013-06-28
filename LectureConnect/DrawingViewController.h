//
//  DrawingViewController.h
//  LectureConnect
//
//  Created by student on 6/20/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DrawingCanvas.h"

@interface DrawingViewController : NSViewController
@property (strong) IBOutlet DrawingCanvas *canvas;

@end
