//
//  IMBackendClient+Middleware.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 11/17/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "SDKiOSCore.h"
#import "IMBackendClient.h"

@interface IMBackendClient (Middleware)

- (void)middlewareUniversalRequestWithParameters:(NSArray * _Nonnull)parameters
                                           OPKey:(NSString * _Nullable)opKey
                                    successBlock:(IMCompletionBlock _Nullable)success
                                    failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(middlewareUniversalRequest(parameters:OPKey:success:failure:));

- (void)middlewareRequestWithParameters:(NSDictionary * _Nonnull)parameters
                                  OPKey:(NSString * _Nullable)opKey
                           successBlock:(IMCompletionBlock _Nullable)success
                           failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(middlewareRequest(parameters:OPKey:success:failure:));
@end
