//
//  BufferObject.m
//  LectureConnect
//
//  Created by student on 6/19/13.
//  Copyright (c) 2013 RIT. All rights reserved.
//

#import "BufferObject.h"
#import "BufferDiff.h"

@implementation BufferObject {
    NSMutableArray *buffer;
}

- (id)init
{
    self = [super init];
    if (self){
        buffer = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addChange:(CGPoint)newPoint
{
    NSDate *time = [NSDate date];
    BufferDiff *obj = [[BufferDiff alloc] init];
    [obj setTimestamp:time];
    [obj setPoint:newPoint];
    [buffer addObject:obj];
}

- (NSDictionary *)getData
{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:buffer.count];
    for (BufferDiff *obj in buffer) {
        [data setObject:@{@"x": @(obj.point.x), @"y": @(obj.point.y)} forKey:[NSString stringWithFormat:@"%f", [obj.timestamp timeIntervalSince1970]]];
    }
    return data;
}

@end
