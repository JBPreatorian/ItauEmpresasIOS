//
//  IMTokenManager.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 9/3/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "IMBlockTypes.h"
#import "IMTokenManagerDelegate.h"
#include "IMUISDKProtocols.h"

@class IMResponseSecurity;
@class IMResponse;

@interface IMTokenManager: NSObject<IMTokenManagerDelegate>

@property(nonatomic, weak) Class<IMTokenUIInterfaceDelegate> tokenInterfaceDelegate;

@property(nonatomic, weak) Class<IMUnlockTokenUIInterfaceDelegate> unlockedTokenInterfaceDelegate;

@property(nonatomic, weak) Class<IMPasswordUIInterfaceDelegate> passwordInterfaceDelegate;

@property(nonatomic, weak) Class<IMElectronicPasswordUIInterfaceDelegate> electronicPasswordInterfaceDelegate;

@property(nonatomic, weak) Class<IMUISDKInterfaceLoadingDelegate> interfaceLoadingDelegate;

@property(nonatomic, weak) Class<IMUISDKAlertDelegate> alertInterfaceDelegate;

@property(nonatomic, weak) Class<IMUISDKIncentiveDelegate> incentiveDelegate;

@property(nonatomic, weak) Class<IMWebviewNativeBridgeDelegate> webviewNativeBridgeDelegate;

+ (instancetype)sharedManager;

+ (void)showTokenFlowForSecurityData:(IMResponseSecurity *)security andOpkey:(NSString *)opkey;

+ (void)configureWithResponse:(IMResponse *)response successBlock:(IMCompletionBlock)success failureBlock:(IMCompletionBlock)failure;
- (void)clearActions;

@end
