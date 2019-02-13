//
//  IMNetworkHelpers.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/12/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMNetworkHelpers: NSObject

+ (NSString *)userAgent;

+ (void)stringAppendedForUserAgentFromConfigurator:(NSString *)stringUA;
+ (void)stringAppendedForUserAgentFromTouchID:(NSString *)stringUA;

@end
