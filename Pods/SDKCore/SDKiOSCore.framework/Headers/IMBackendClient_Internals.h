//
//  IMBackendClient_Internals.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/14/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "SDKiOSCore.h"
#import "IMBackendClientHeaders.h"

@class IMRequestsManager;
@class IMResponseSecurity;
@class LegacyMenu;

typedef void (^AFNSuccessBlock)(NSURLSessionDataTask *, id);
typedef void (^AFNFailureBlock)(NSURLSessionDataTask *, NSError *);
typedef void (^AFNProgressBlock)(NSProgress *);

@interface IMBackendClient ()

#pragma mark - For Card Password and Cvv Validation

@property(nonatomic, strong) IMResponse *response;
@property(nonatomic, copy) IMCompletionBlock successPassword;
@property(nonatomic, copy) IMCompletionBlock failurePassword;
@property(nonatomic, copy) IMCompletionBlock successCVV;
@property(nonatomic, copy) IMCompletionBlock failureCVV;

#pragma mark - For ITi Facial Biometry

@property(nonatomic, copy) IMCompletionBlock successFacialBiometry;
@property(nonatomic, copy) IMCompletionBlock failureFacialBiometry;
@property(nonatomic, copy) FacialBiometryCompletionBlock facialBiometryCompletion;

#pragma mark - For Eletronic Password for ITi

@property (nonatomic, copy) IMCompletionBlock successEletronicPassword;
@property (nonatomic, copy) IMCompletionBlock failureEletronicPassword;

#pragma mark - For ITi SMS

@property (nonatomic, copy) IMCompletionBlock successSMS;
@property (nonatomic, copy) IMCompletionBlock failureSMS;

#pragma mark - Others

@property (nonatomic, strong) dispatch_semaphore_t latch;

@property (nonatomic, strong) IMResponseSecurity *security;
@property (nonatomic, copy) NSMutableDictionary  *flow;
@property (nonatomic, copy) NSMutableDictionary  *legacyFlow;
@property (nonatomic, copy, readonly) NSURL      *routerBaseURL;
@property (nonatomic, copy, readonly) NSURL      *loyaltyBaseURL;
@property (nonatomic, copy, readonly) NSURL      *publicBaseURL;
@property (nonatomic, copy, readonly) NSURL      *analyticsBaseURL;
@property (nonatomic, copy, readonly) NSURL      *webviewBaseURL;
@property (nonatomic, copy) NSDictionary         *routes;
@property (nonatomic, copy, readonly) NSString   *psvValue;
@property (nonatomic, copy, readonly) NSString   *psvKey;
@property (nonatomic, strong) IMRequestsManager  *manager;
@property (nonatomic, assign) BOOL               fromSMS;

@property (nonatomic, copy) LegacyMenu *legacyMenu;
@property (nonatomic, strong, readonly) NSString *userID;

@property (nonatomic, strong) NSString *idleSessionTimeoutHeader;
@property (nonatomic, strong) NSDate   *idleSessionTimeout;

@property (nonatomic, strong) NSString *sessionTimeoutHeader;
@property (nonatomic, strong) NSDate   *sessionTimeout;

@property (nonatomic, strong) NSString *authToken;
@property (nonatomic, strong) NSString *authSession;

@property (nonatomic, strong) NSNumber *requestTimeout;
@property (nonatomic, strong) IMValidateTokenNotificationManager *validateToken;
@property (nonatomic, strong) IMPasswordNavigationManager        *passwordNavigation;

@property (nonatomic, assign) BOOL startedValidateToken;
@property (nonatomic, strong) NSString *tokenQueryResponse;
@property (nonatomic, assign) BOOL     shouldForcePassword;
@property (nonatomic, assign) BOOL     isComingFromInstallTokenApp;
@property (nonatomic, assign) BOOL     shouldInstallTokenAppWhiteList;

@property (nonatomic, strong) NSString *cacheSessionId;
@property (nonatomic, strong) NSMutableDictionary *cacheData;
@property (nonatomic, strong) id<IMCacheStorageProtocol> storage;

@property (nonatomic, strong) IMLocationTracking *locationManager;

- (LegacyMenu *)legacyMenuWithFailure:(IMCompletionBlock)failure;

- (void)setupSecurityForProduction;
- (void)cleanManagerInstance;

- (void)executeResponse:(IMResponse *)response successBlock:(IMCompletionBlock)success failureBlock:(
        IMCompletionBlock)failure;
- (void)executeFailureResponse:(IMResponse *)response failureBlock:(IMCompletionBlock)failure;
- (void)executeSuccessResponse:(IMResponse *)response successBlock:(IMCompletionBlock)success;
- (void)executeMiddlewareFailureResponse:(IMResponse *)response failureBlock:(IMCompletionBlock)failure;
- (void)executeCustomFailureResponse:(IMResponse *)response failureBlock:(IMCompletionBlock)failure;
- (void)clearFlow;
- (void)loadCacheData:(NSString *)key;
- (void)setRouterBaseURL:(NSURL *)routerBaseURL;

@end
