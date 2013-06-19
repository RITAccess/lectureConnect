//
//  BufferObject.h
//  LectureConnect
//
//  Created by student on 6/19/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BufferObject : NSObject

- (void)addChange:(CGPoint)newPoint;
- (NSDictionary *)getData;

@end
