//
// Created by Tales Pinheiro De Andrade on 18/01/17.
// Copyright (c) 2017 Concrete Solutions. All rights reserved.
//

#ifndef SDKIOSCORE_IMUISDKPROTOCOLS_H
#define SDKIOSCORE_IMUISDKPROTOCOLS_H

#import <Foundation/Foundation.h>
#import "IMTokenTypes.h"
#import "IMCommandTypes.h"
#import "IMTokenManagerDelegate.h"
#import "IMMotorManagerDelegate.h"
#import "IMAccessKeyManagerDelegate.h"
#import "IMCvvValidationDelegate.h"
#import "IMCardPasswordManagerDelegate.h"
#import "IMFaceBiometryManagerDelegate.h"
#import "IMEletronicPasswordManagerDelegate.h"
#import "IMSMSManagerDelegate.h"
#import "IMTouchIDManagerDelegate.h"

@class IMResponseSecurity;

@protocol IMTokenUIInterfaceDelegate

+ (void)presentInterfaceWithDelegate:(id<IMTokenManagerDelegate>)delegate securityData:(IMResponseSecurity *)security opKey:(NSString *)key;
+ (void)endEditing:(signed char)editing;
+ (void)presentUnlockedInterfaceWithDelegate:(id<IMTokenManagerDelegate>)delegate type:(IMTokenType)type;
+ (void)closeInterface;

@optional
+ (void)invalidTokenWithTokenType:(IMTokenType)type;
+ (void)showDefaultError;

@end

@protocol IMMotorUIInterfaceDelegate

+ (void)presentInterfaceWithDelegate:(id<IMMotorManagerDelegate>)manager
                        securityData:(IMResponseSecurity *)securityData
                               opKey:(NSString *)key;

+ (void)closeInterface;

@end

@protocol IMUnlockTokenUIInterfaceDelegate

+ (void)presentInterfaceWithDelegate:(NSObject<IMTokenManagerDelegate> *)delegate type:(IMTokenType)type;
+ (void)closeInterface;

@end

@protocol IMElectronicPasswordUIInterfaceDelegate

+ (void)presentInterfaceWithDelegate:(id<IMAccessKeyManagerDelegate>)manager;

+ (void)closeInterface;

@end

@protocol IMPasswordUIInterfaceDelegate

+ (void)presentInterfaceWithDelegate:(id<IMTokenManagerDelegate>)manager securityData:(IMResponseSecurity *)securityData;
+ (void)closeInterface;

@optional
+ (void)presentInterfaceWithCardPasswordDelegate:(id<IMCardPasswordManagerDelegate>)manager
                                    securityData:(IMResponseSecurity *)securityData;
+ (void)didEnterPasswordErrorWith:(IMResponse *)failureBlock;
+ (void)showAlertWithMessage:(NSString *)message;

@end

@protocol IMUISDKAlertDelegate

+ (void)presentInterfaceWithMessage:(NSString *)message
                      actionMessage:(NSString *)actionMessage
                      cancelMessage:(NSString *)cancelMesssage
                        actionBlock:(void (^)())actionBlock
                        cancelBlock:(void (^)())cancelBlock;

+ (void)presentInterfaceWithMessage:(NSString *)message cancel:(NSString *)cancel actionBlock:(void (^)())block;

+ (void)closeInterface;

@end

@protocol IMUISDKInterfaceLoadingDelegate

+ (void)startLoading;
+ (void)stopLoading;

@end

@protocol IMUISDKWebviewDelegate

+ (void)presentInterfaceWithURLString:(NSString *)url;
+ (void)closeInterface;

@end

@protocol IMTokenAlertDelegate<NSObject>

- (void)showUnlockedTokenWithType:(IMTokenType)type;

@end

@protocol IMUISDKIncentiveDelegate

+ (void)presentInterfaceWithType:(NSInteger)type
                      andMessage:(NSInteger)message
                   andQueryNeeds:(BOOL)queryNeeds
                   andCompletion:(void (^)(NSInteger type))completion
                 andPreviousPage:(NSString*)previousPage;

+ (void)presentInterfaceWithDelegate:(id<IMTokenManagerDelegate>)manager
                        securityData:(IMResponseSecurity *)securityData
                               opKey:(NSString *)key
                     andPreviousPage:(NSString*)previousPage;

+ (void)closeInterface;

@end

@protocol IMUISDKInstallTokenInterfaceDelegate

+ (void)presentInterface;

+ (void)closeInterface;

@end

@protocol IMUISDKTokenValidationDelegate

+ (void)setupTokenValidationViewController;

@end

@protocol IMUISDKCvvValidationDelegate

+ (void)presentInterfaceWithDelegate:(id<IMCvvValidationDelegate>)delegate;

+ (void)dismissInterface;

@optional

+ (void)didEnterCvvErrorWith:(IMResponse *)failureBlock;


@end

@protocol IMUISDKTokenUninstallDelegate

+ (void)presentInterfaceWithInstallTokenBlock:(IMBaseSuccessBlock)installTokenBlock andCloseFlowBlock:(IMBaseSuccessBlock)closeFlowBlock;

+ (void)dismissInterface;

@end

@protocol IMUISDKAnotherTokenDeviceDelegate

+ (void)presentInterface:(IMBaseSuccessBlock)installTokenBlock andCloseFlowBlock:(IMBaseSuccessBlock)closeFlowBlock;

@end

@protocol IMUISDKAnotherTokenDelegate

+ (void)presentInterface:(IMBaseSuccessBlock)installTokenBlock andCloseFlowBlock:(IMBaseSuccessBlock)closeFlowBlock;

@end

@protocol IMUISDKGoCEIDelegate

+ (void)presentInterface;

@end

@protocol IMUISDKEnableAppsInterfaceDelegate

+ (void)presentWithInstallInterface:(BOOL)install;
+ (void)closeInterface;

@end

@protocol IMWebviewNativeBridgeDelegate

+ (void)closeInterface;

@end

@protocol IMUISDKFaceBiometryDelegate

+ (void)presentInterfaceWithDelegate:(id<IMFaceBiometryManagerDelegate>)delegate attempts:(int)attempts command:(IMCommandType)type;
+ (void)closeInterface;

@optional

+ (void)didEnterFacialBiometryErrorWith:(IMResponse *)failureBlock;
+ (void)showCaptureErrorWithTitle:(NSString*)title andMessage:(NSString*)message;

@end

@protocol IMUISDKEletronicPasswordDelegate

+ (void)presentInterfaceWithDelegate:(id<IMEletronicPasswordManagerDelegate>)delegate sequence: (NSString*) keyboardSequence;
+ (void)closeInterface;

@optional

+ (void)didEnterEletronicPassworErrorWith:(IMResponse *)failureBlock;

@end

@protocol IMUISDKSMSDelegate

+ (void) presentInterfaceWithDelegate:(id<IMSMSManagerDelegate>) delegate;
+ (void) closeInterface;
+ (void) didEnterSMSErrorWith: (IMResponse *) failureBlock;
+ (void) didNotSendSMS: (IMResponse *) failureBlock;

@end

@protocol IMUISDKTouchIDPasswordDelegate

+ (void) presentInterfaceWithDelegate: (id<IMTouchIDManagerDelegate>)delegate;
+ (void) closeInterface;
+ (void) didEnterWrongPassword;

@end

#endif //SDKIOSCORE_IMUISDKPROTOCOLS_H
