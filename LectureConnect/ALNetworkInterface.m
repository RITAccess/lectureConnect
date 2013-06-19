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
    [_socket connectToHost:[_connectionURL description] onPort:9000];
}

- (void)sendUpdate:(BufferObject *)data
{
    NSLog(@"Sending Data");
    [_socket sendEvent:@"update" withData:[data getData]];
}

#pragma mark SocketIO delegate methods

- (void) socketIODidConnect:(SocketIO *)socket
{
    [_socket sendEvent:@"connect-teacher" withData:@{@"name":@"Math Class"}];
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
}

- (void) socketIO:(SocketIO *)socket didSendMessage:(SocketIOPacket *)packet
{
    
}

- (void) socketIO:(SocketIO *)socket onError:(NSError *)error
{
    
}

@end
