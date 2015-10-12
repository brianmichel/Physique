//
//  PhysiqueSystemInformation.h
//  Physique
//
//  Created by Brian Michel on 10/8/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

@import Foundation;

@interface PhysiqueSystemInformation : NSObject

@property (nonnull, copy, readonly) NSString *systemName;

@property (nonnull, copy, readonly) NSString *systemVersion;

+ (nonnull PhysiqueSystemInformation *)defaultSystemInformation;

@end
