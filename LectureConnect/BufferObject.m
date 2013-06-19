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
    int i = 0;
    for (BufferDiff *obj in buffer) {
        [data setObject:@{@"timestamp" : @(obj.timestamp.timeIntervalSince1970), @"x": @(obj.point.x), @"y": @(obj.point.y)} forKey:[NSString stringWithFormat:@"%d", i]];
        i++;
    }
    return data;
}

- (NSUInteger)count
{
    return buffer.count;
}

@end
