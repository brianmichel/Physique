//
//  PhysiqueOperationMonitor.m
//  Physique
//
//  Created by Brian Michel on 10/10/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

#import "PhysiqueOperationMonitor.h"

@interface PhysiqueOperationMonitor ()

@property (nonnull) NSOperationQueue *operationMonitorQueue;

@property (nonnull) id notificationObservationToken;

@end

@implementation PhysiqueOperationMonitor

- (instancetype)init
{
    self = [super init];
    if (self) {
        _operationMonitorQueue = [[NSOperationQueue alloc] init];
        _operationMonitorQueue.name = @"com.bsm.xcode.phsyique.monitor";

        _notificationObservationToken = [[NSNotificationCenter defaultCenter] addObserverForName:nil object:nil queue:_operationMonitorQueue usingBlock:^(NSNotification * _Nonnull note) {
            NSLog(@"[PHYSIQUE] %@", note);
        }];
    }

    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self.notificationObservationToken];
}

@end
