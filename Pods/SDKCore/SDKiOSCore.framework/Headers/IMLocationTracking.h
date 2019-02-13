//
//  IMLocationTracking.h
//  SDKiOSCore
//
//  Created by Bruno Fernandes on 10/05/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMLocation.h"

@interface IMLocationTracking : NSObject

/**
 * Used by get the last location.
 */
@property (nonatomic, strong, readonly, nullable) IMLocation *lastLocation;

/*!
 @method
 
 @abstract
 Start monitoring to location
 
 */
- (void) startMonitor;
/*!
 @method
 
 @abstract
 Stop monitoring to location
 
 */
- (void) stopMonitor;

@end
