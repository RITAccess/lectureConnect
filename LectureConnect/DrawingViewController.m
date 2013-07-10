//
//  DrawingViewController.m
//  LectureConnect
//
//  Created by student on 6/20/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "DrawingViewController.h"
#import "DrawingCanvas.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController {
    ALNetworkInterface *_server;
}

- (void)connectedToServer:(ALNetworkInterface *)server
{
    _server = server;
    _server.delegate = self;

}

#pragma mark NetworkDataSource

- (CGSize)screenSize
{
    return self.view.frame.size;
}


@end
