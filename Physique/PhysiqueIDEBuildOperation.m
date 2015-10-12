//
//  PhysiqueIDEBuildOperation.m
//  Physique
//
//  Created by Brian Michel on 10/11/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

#import "PhysiqueIDEBuildOperation.h"

static inline bool phy_is_ide_build_operation(id possible_operation)
{
    return [possible_operation isKindOfClass:NSClassFromString(@"IDEBuildOperation")];
}

@interface PhysiqueIDEBuildOperation ()

@property (nonnull) id buildOperation;

@end

@implementation PhysiqueIDEBuildOperation

- (instancetype)initWithDVTIDEBuildOperation:(id)buildOperation
{
    if (!phy_is_ide_build_operation(buildOperation))
    {
        return nil;
    }

    self = [super init];
    if (self)
    {
        _buildOperation = buildOperation;
    }

    return self;
}

- (NSDate *)startTime
{
    id startTime = [self.buildOperation valueForKeyPath:@"startTime"];
    if ([startTime isKindOfClass:[NSDate class]]) {
        return startTime;
    }

    return nil;
}

- (NSDate *)stopTime
{
    id stopTime = [self.buildOperation valueForKeyPath:@"stopTime"];
    if ([stopTime isKindOfClass:[NSDate class]]) {
        return stopTime;
    }

    return nil;
}

@end
