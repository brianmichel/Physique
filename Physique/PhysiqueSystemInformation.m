//
//  PhysiqueSystemInformation.m
//  Physique
//
//  Created by Brian Michel on 10/8/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

#import "PhysiqueSystemInformation.h"

@implementation PhysiqueSystemInformation

+ (PhysiqueSystemInformation *)defaultSystemInformation
{
    return [[[self class] alloc] init];
}

- (PhysiqueSystemInformation *)init
{
    self = [super init];
    if (self) {
        NSProcessInfo *info = [NSProcessInfo processInfo];

        _systemName = [info.hostName copy];
        _systemVersion = [info.operatingSystemVersionString copy];
    }
    return self;
}

@end
