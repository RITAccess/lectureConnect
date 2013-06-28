//
//  ALNetworkInterface.m
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "ALNetworkInterface.h"
#import "SocketIOJSONSerialization.h"
#import "SocketIOPacket.h"

@interface ALNetworkInterface ()

@property (nonatomic) SocketIO *socket;

@end

@implementation ALNetworkInterface

- (id)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        _connectionURL = url;
    }
    return self;
}

- (void)connect
{
    _socket = [[SocketIO alloc] initWithDelegate:self];
//    [_socket connectToHost:[_connectionURL description] onPort:9000];
    [_socket connectToHost:@"students-imac.wireless.rit.edu" onPort:9000];
}

#pragma mark update drawing

- (void)sendMoveToPoint:(CGPoint)point
{
    [_socket sendEvent:@"update" withData:@{
                                            @"action" : @"moveTo",
                                            @"x" : [@(point.x) stringValue],
                                            @"y" : [@(point.y) stringValue]
                                            }];
}

- (void)sendLineToPoint:(CGPoint)point
{
    [_socket sendEvent:@"update" withData:@{
                                            @"action" : @"lineTo",
                                            @"x" : [@(point.x) stringValue],
                                            @"y" : [@(point.y) stringValue]
                                            }];
}

#pragma mark SocketIO delegate methods

- (void) socketIODidConnect:(SocketIO *)socket
{
    NSLog(@"Did connect");
    [_socket sendEvent:@"connect-teacher" withData:@{@"name":_lecture}];
    if ([_delegate respondsToSelector:@selector(screenSize)]) {
        CGSize size = [_delegate screenSize];
        [_socket sendEvent:@"set-cord" withData:@{@"width" : @(size.width), @"height" : @(size.height)}];
    }

}

- (void) socketIODidDisconnect:(SocketIO *)socket disconnectedWithError:(NSError *)error
{
    
}

- (void) socketIO:(SocketIO *)socket didReceiveMessage:(SocketIOPacket *)packet
{

}

- (void) socketIO:(SocketIO *)socket didReceiveJSON:(SocketIOPacket *)packet
{
    
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    // Get Name
    if ([packet.name isEqualToString:@"get-name"]) {
        [_socket sendEvent:@"set-name" withData:[[NSHost currentHost] localizedName]];
    }
    // Get size
    if ([packet.name isEqualToString:@"get-size"]) {
        
    }
}

- (void) socketIO:(SocketIO *)socket didSendMessage:(SocketIOPacket *)packet
{
    
}

- (void) socketIO:(SocketIO *)socket onError:(NSError *)error
{
    NSLog(@"Errored: %@", error.description);
}

@end
