//
//  NSDictionary+IMUtils.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/17/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMClientParams;

@interface NSDictionary (IMUtils)

- (IMClientParams *)im_cliParams;

- (IMClientParams *)im_cliParamsWithError:(NSError **)error;

- (NSData *)im_dataRepresentationWithError:(NSError **)error;

- (NSString *)im_jsonStringRepresentationWithError:(NSError **)error;

@end
