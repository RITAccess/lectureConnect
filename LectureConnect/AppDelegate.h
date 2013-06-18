//
//  AppDelegate.h
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ALNetworkInterface.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain) ALNetworkInterface *server;

@end
