//
//  ALNetworkInterface.h
//  LectureConnect
//
//  Created by student on 6/18/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALNetworkInterface : NSObject

@property (nonatomic, retain) NSURL *connectionURL;

- (id)initWithURL:(NSURL *)url;

@end
