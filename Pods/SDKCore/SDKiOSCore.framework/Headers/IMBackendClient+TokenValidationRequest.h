//
//  IMBackendClient+TokenValidationRequest.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 11/24/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "SDKiOSCore.h"

@interface IMBackendClient (TokenValidationRequest)

- (void)requestSMSTokenWithUnlockFlag:(BOOL)unlock
                         successBlock:(IMCompletionBlock _Nullable)success
                         failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(requestSMSToken(unlock:success:failure:));

- (void)sendSMSSecurityCodeCardWithDictionary:(NSDictionary *_Nonnull)phoneParams
                                 successBlock:(IMCompletionBlock _Nullable)success
                                 failureBlock:(IMCompletionBlock _Nullable) _Nullablefailure;

- (void)validateSMSToken:(NSString * _Nonnull)token
             unlockToken:(NSString * _Nonnull)unlockToken
            successBlock:(IMCompletionBlock _Nullable)success
            failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(validateSMSToken(token:unlockToken:success:failure:));

- (void)validateSecurityCodeCard:(NSString * _Nonnull)securityCode
                    successBlock:(IMCompletionBlock _Nullable)success
                    failureBlock:(IMCompletionBlock _Nullable) failure;

- (void)validateTokenApp:(NSString * _Nonnull)token
             unlockToken:(NSString * _Nonnull)unlockToken
            successBlock:(IMCompletionBlock _Nullable)success
            failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(validateTokenApp(token:unlockToken:success:failure:));

- (void)validateKeyHolderToken:(NSString * _Nonnull)token
                   unlockToken:(NSString * _Nonnull)unlockToken
                  successBlock:(IMCompletionBlock _Nullable)success
                  failureBlock:(IMCompletionBlock _Nullable)failure NS_SWIFT_NAME(validateKeyHolderToken(token:unlockToken:success:failure:));

@end
