//
//  IMErrorFactory.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 10/21/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMErrorFactoryCodeStatus.h"

@interface IMErrorFactory: NSObject

+ (NSError *)errorWithCode:(IMErrorCode)errorCode;
+ (BOOL)errorWithCode:(IMErrorCode)errorCode andError:(NSError **)error;

@end
