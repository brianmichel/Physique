//
//  PhysiqueIDEBuildOperation.h
//  Physique
//
//  Created by Brian Michel on 10/11/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhysiqueIDEBuildOperation : NSObject

- (instancetype)initWithDVTIDEBuildOperation:(id)buildOperation;

@property (readonly) NSDate *startTime;

@property (readonly) NSDate *stopTime;

@end
