//
//  IMBackendClient.h
//  iOSSDK
//
//  Created by Alexandre Garrefa on 5/19/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMAnalyticsDelegate.h"
#import "IMBackendClientCustomSetupKeys.h"
#import "IMBackendClientSetupKeys.h"
#import "IMBlockTypes.h"
#import "IMValidateTokenNotificationManager.h"
#import "IMAnalyticsManager.h"
#import "LegacyMenu.h"
#import "IMLocation.h"
#import "IMHeader.h"
#import <Foundation/Foundation.h>
#import "IMUISDKProtocols.h"
#import "LegacyMenu.h"
#import "IMTrackerDelegate.h"
#import "IMPasswordNavigationManager.h"
#import "IMBackendSessionDelegate.h"
@import SDKiOSRoutes;

@class IMClientParams;
@class AFNetworkReachabilityManager;

@interface IMBackendClient: NSObject

@property (nonatomic, strong, readonly, nullable) IMLocation *lastLocation;
@property (nonatomic, strong, nonnull) AFNetworkReachabilityManager *reachabilityManager;
@property (nonatomic, strong, nullable) IMAnalyticsManager *analyticsManager;

@property (nonatomic, weak, nullable) Class<IMUISDKAlertDelegate>   alertInterfaceDelegate;
@property (nonatomic, weak, nullable) Class<IMUISDKWebviewDelegate> webviewInterfaceDelegate;

#pragma mark - Cards

@property (weak, nonatomic, nullable) Class<IMUISDKIncentiveDelegate> incentiveInterfaceDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKInstallTokenInterfaceDelegate> installTokenDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKTokenValidationDelegate> tokenValidationUIDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKCvvValidationDelegate> cvvValidationUIDelegate;
@property (weak, nonatomic, nullable) Class<IMPasswordUIInterfaceDelegate> cardPasswordInterfaceDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKTokenUninstallDelegate> tokenUninstallDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKAnotherTokenDeviceDelegate> anotherTokenDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKAnotherTokenDeviceDelegate> anotherTokenDeviceDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKGoCEIDelegate> goCEIDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKEnableAppsInterfaceDelegate> enableAppsIterfaceDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKFaceBiometryDelegate> faceBiometryInterfaceDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKEletronicPasswordDelegate> eletronicPasswordInterfaceDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKSMSDelegate> smsInterfaceDelegate;
@property (weak, nonatomic, nullable) Class<IMUISDKTouchIDPasswordDelegate> touchIDPasswordInterfaceDelegate;
@property (weak, nonatomic, nullable) id<IMTrackerDelegate> trackerDelegate;
@property (weak, nonatomic, nullable) id<IMBackendSessionDelegate> sessionDelegate;

@property (nonatomic, assign) double timeLeftValidateToken;
@property (nonatomic, strong, readonly, nullable) NSString *sessionTimeoutHeader;
@property (nonatomic, strong, readonly, nullable) NSDate   *sessionTimeout;
@property (nonatomic, strong, readonly, nullable) NSString *authToken;
@property (nonatomic, strong, readonly, nullable) NSString *authSession;
@property (nonatomic, copy, readonly, nonnull)    NSURL    *usabilityBaseURL;
@property (nonatomic, assign) Country country;

+ (instancetype _Nonnull)sharedClient NS_SWIFT_NAME(shared());

- (BOOL)setupParams:(NSDictionary * _Nonnull)params error:(NSError * _Nullable * _Nullable)error NS_SWIFT_NAME(setup(params:));

- (BOOL)setupRoutes:(NSDictionary * _Nonnull)routes error:(NSError * _Nullable * _Nullable)error NS_SWIFT_NAME(setup(routes:));

- (BOOL)setupCustomParams:(NSDictionary * _Nonnull)params error:(NSError * _Nullable * _Nullable)error NS_SWIFT_NAME(setup(customParams:));

- (void)requestWithParams:(IMClientParams *_Nonnull)params
                    OPKey:(NSString *_Nullable)opKey
             successBlock:(IMCompletionBlock _Nullable)success
             failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(request(params:opKey:success:failure:));

- (void)requestWithParams:(IMClientParams *_Nonnull)params
           requestHeaders:(NSArray<IMHeader *> *_Nonnull)headers
             successBlock:(IMCompletionBlock _Nullable)success
             failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(request(params:headers:success:failure:));

- (void)logout:(BOOL)shouldToReset
  successBlock:(IMCompletionBlock _Nullable)success
  failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(logout(shouldReset:success:failure:));

- (BOOL)isValidSession;

- (void)setupValidateTokenNotificationDelegate:(id<IMValidateTokenNotificationManagerDelegate> _Nullable)delegate;
- (BOOL)setupAnalyticsDelegate:(id<IMAnalyticsDelegate> _Nullable)delegate error:(NSError *_Nullable*_Nullable)error;
- (BOOL)setupPasswordNavigationDelegate:(id<IMPasswordNavigationManagerDelegate> _Nullable)delegate error:(NSError *_Nullable*_Nullable) error;

- (void)cancelSecondsRemainingWaiting NS_SWIFT_NAME(cancelSecondsRemaining());
- (void)cancelFlowBlocks;

- (void)reset;
- (LegacyMenu * _Nonnull)legacyMenuWithFailure:(IMCompletionBlock _Nullable)failure;

- (BOOL)isShowContactUs;
- (BOOL)isShowAttendance;
- (BOOL)isTokenCitiEnabled;
- (BOOL)isTokenCitiEnabledCartonista;
- (NSInteger)getAdobeCharactersLimit;
- (NSInteger)getAdobeCharactersTimer;
- (IMAnalyticsManager * _Nullable) analyticsManagerInstance;


@end
