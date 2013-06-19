//
//  ALNetworkInterface.h
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketIO.h"
#import "BufferObject.h"

@interface ALNetworkInterface : NSObject <SocketIODelegate>

@property (nonatomic, retain) NSURL *connectionURL;

- (id)initWithURL:(NSURL *)url;
- (void)connect;
- (void)sendUpdate:(BufferObject *)data;

@end
