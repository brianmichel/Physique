//
//  PhysiqueBuildSpeedTracker.m
//  Physique
//
//  Created by Brian Michel on 10/10/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

#import "PhysiqueBuildSpeedTracker.h"
#import "PhysiqueIDEBuildOperation.h"

NSString * const PhysiqueBuildStartNotification = @"IDEBuildOperationWillStartNotification";
NSString * const PhysiqueBuildStopNotification = @"IDEBuildOperationDidStopNotification";

@interface PhysiqueBuildSpeedTracker ()

@property (nonnull) NSOperationQueue *buildSpeedTrackerQueue;

@property (nonnull) NSArray *notificationObservationTokens;

@end

@implementation PhysiqueBuildSpeedTracker

- (instancetype)init
{
    self = [super init];
    if (self) {
        _buildSpeedTrackerQueue = [[NSOperationQueue alloc] init];
        _buildSpeedTrackerQueue.name = @"com.bsm.xcode.physique.build-speed-tracker";

        id startToken = [[NSNotificationCenter defaultCenter] addObserverForName:PhysiqueBuildStartNotification
                                                                          object:nil
                                                                           queue:_buildSpeedTrackerQueue
                                                                      usingBlock:^(NSNotification * _Nonnull note) {
                                                                          id object = note.object;
                                                                          PhysiqueIDEBuildOperation *op = [[PhysiqueIDEBuildOperation alloc] initWithDVTIDEBuildOperation:object];
                                                                          NSLog(@"THING: %@ - %@", object, op);
                                                                      }];
        
        id stopToken = [[NSNotificationCenter defaultCenter] addObserverForName:PhysiqueBuildStopNotification
                                                                         object:nil
                                                                          queue:_buildSpeedTrackerQueue
                                                                     usingBlock:^(NSNotification * _Nonnull note) {
                                                                         id object = note.object;
                                                                         PhysiqueIDEBuildOperation *op = [[PhysiqueIDEBuildOperation alloc] initWithDVTIDEBuildOperation:object];
                                                                         NSLog(@"THING: %@ - %@", object, op);
                                                                     }];


        _notificationObservationTokens = @[startToken, stopToken];
    }
    return self;
}

- (void)dealloc {
    for (id token in _notificationObservationTokens) {
        [[NSNotificationCenter defaultCenter] removeObserver:token];
    }
}

@end
