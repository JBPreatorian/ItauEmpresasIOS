//
//  IMBackendClient+Token.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 11/18/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMBackendClient.h"
#import "IMBlockTypes.h"

typedef NS_ENUM (NSInteger, IMNormalizeTokenStatus) {
    IMNormalizeTokenNotChanged,
    IMNormalizeTokenNormalized
};

@interface IMBackendClient (Token)

- (BOOL)shouldInstallTokenAppUsingPassword;

- (BOOL)shouldInstallTokenAppForWhiteList;

- (BOOL)shouldInstallTokenAppOtherDevice;

- (BOOL)isSMSBlockItokenAppOtherDevice;

- (void)queryTokenAppWithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                         failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(queryTokenApp(success:failure:));

- (void)installTokenAppWithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                           failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(installTokenApp(success:failure:));

- (void)uninstallTokenAppWithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                             failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(uninstallTokenApp(success:failure:));;

- (void)installTokenAppFromOtherCellWithSuccessBlock:(NSString * _Nonnull)tokenType
                                             success:(IMCompletionBlock _Nullable)successBlock
                                        failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(installTokenAppFromOtherCell(tokenType:success:failure:));

- (void)normalizeTokenAppWithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                             failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(normalizeTokenApp(success:failure:));

- (void)validateSentPassword:(NSString *_Nonnull)password
                successBlock:(IMCompletionBlock _Nullable)successBlock
                failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(validateSent(password:success:failure:));

- (NSDictionary * _Nullable)firstTokenInfo;

- (NSString *_Nullable)decryptStringForTokenQRCode:(NSString * _Nonnull)stringToBeDecrypted NS_SWIFT_NAME(decryptToken(qrCode:));

#pragma mark - Cartões

- (void)installCardTokenAppWithSuccessBlock:(IMCompletionBlock _Nonnull)successBlock
                               failureBlock:(IMCompletionBlock _Nonnull)failure;

- (void)registerCardTokenApp:(IMCompletionBlock _Nonnull)successBlock
                failureBlock:(IMCompletionBlock _Nonnull)failure;

#pragma mark - Projeto Olympus PF - Cliente G2 (Citi)

- (void)installTokenAppG2WithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                             failureBlock:(IMCompletionBlock _Nullable)failure
NS_SWIFT_NAME(installTokenAppG2(success:failure:));

- (void)uninstallTokenAppG2WithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                               failureBlock:(IMCompletionBlock _Nullable)failure
NS_SWIFT_NAME(uninstallTokenAppG2(success:failure:));;

#pragma mark - Projeto Olympus Cartonista - Cliente G2 (Citi)

- (void)installTokenAppCartonistaG2WithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                                       failureBlock:(IMCompletionBlock _Nullable)failure
NS_SWIFT_NAME(installTokenAppCartonistaG2(success:failure:));

- (void)uninstallTokenAppCartonistaG2WithSuccessBlock:(IMCompletionBlock _Nullable)successBlock
                                         failureBlock:(IMCompletionBlock _Nullable)failure
NS_SWIFT_NAME(uninstallTokenAppCartonistaG2(success:failure:));;

@end
