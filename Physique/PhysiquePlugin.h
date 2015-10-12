//
//  PhysiquePlugin.h
//  Physique
//
//  Created by Brian Michel on 10/8/15.
//  Copyright © 2015 Brian Michel. All rights reserved.
//

@import Foundation;

@interface PhysiquePlugin : NSObject

@property (readonly) NSBundle *pluginBundle;

+ (instancetype)sharedPlugin;

- (instancetype)initWithBundle:(NSBundle *)bundle NS_DESIGNATED_INITIALIZER;

@end
