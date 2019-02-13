//
//  IMRequestsManager.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/12/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "IMBlockTypes.h"
#import <AFNetworking/AFNetworking.h>

@class IMClientParams;

@interface IMRequestsManager: AFHTTPSessionManager

- (void)requestWithMethod:(NSString *)method
                     path:(NSString *)path
               parameters:(id)parameters
             successBlock:(AFNetworkSuccessBlock)success
             failureBlock:(AFNetworkFailureBlock)failure;

#pragma mark - Router Abstraction Utils

- (void)addRouterCustomHTTPHeadersWithCliParams:(IMClientParams *)cliParams;
- (void)addRouterCustomHTTPHeadersWithAuthToken:(NSString *)authToken;

#pragma mark - Network Abstraction Utils

- (void)addCustomHTTPHeaders:(NSDictionary *)header;
- (void)addHTTPHeaders:(NSArray *)headers;

- (BOOL)setOpKey:(NSString *)opKey;

@end
