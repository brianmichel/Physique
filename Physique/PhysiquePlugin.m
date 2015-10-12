//
//  PhysiquePlugin.m
//  Physique
//
//  Created by Brian Michel on 10/8/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

@import AppKit;

#import "PhysiquePlugin.h"
#import "PhysiqueOperationMonitor.h"
#import "PhysiqueBuildSpeedTracker.h"

static PhysiquePlugin *sharedPlugin;

@interface PhysiquePlugin ()

@property (nonnull) PhysiqueOperationMonitor *operationMonitor;
@property (nonnull) PhysiqueBuildSpeedTracker *tracker;

@end

@implementation PhysiquePlugin

#ifdef NS_UNAVAILABLE
- (id)init NS_UNAVAILABLE
{
    return nil;
}
#endif

+(void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPlugin = [[PhysiquePlugin alloc] initWithBundle:plugin];
    });
}

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (instancetype)initWithBundle:(NSBundle *)bundle
{
    self = [super init];
    if (self) {
        _pluginBundle = bundle;
        _operationMonitor = [[PhysiqueOperationMonitor alloc] init];
        _tracker = [[PhysiqueBuildSpeedTracker alloc] init];
    }
    return self;
}

@end
