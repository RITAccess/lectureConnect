//
//  ALNetworkInterface.h
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketIO.h"

@protocol NetworkDataSource <NSObject>

- (CGSize)screenSize;

@end

@interface ALNetworkInterface : NSObject <SocketIODelegate>

@property (nonatomic, retain) NSURL *connectionURL;
@property (nonatomic, retain) NSString *lecture;

@property (nonatomic, retain) id<NetworkDataSource> delegate;

- (id)initWithURL:(NSURL *)url;
- (void)connect;

- (void)sendMoveToPoint:(CGPoint)point;
- (void)sendLineToPoint:(CGPoint)point;

@end
