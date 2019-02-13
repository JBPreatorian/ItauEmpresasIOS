//
//  IMBackendClient+FaceBiometry.h
//  SDKiOSCore
//
//  Created by Filipe Henrique Souza on 16/11/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import "IMBackendClient.h"

@protocol IMFaceBiometryManagerDelegate;

@interface IMBackendClient (FaceBiometry) <IMFaceBiometryManagerDelegate>

- (void)presentFacialBiometryWithNumberOfAttempts:(int)attemps
                                   withCompletion:(FacialBiometryCompletionBlock)completion;

- (void)handleFacialBiometryWithResponse:(IMResponse *)response
                                security:(IMResponseSecurity*)security
                            successBlock:(IMCompletionBlock)success
                            failureBlock:(IMCompletionBlock)failure;

- (void)updateBioParameters;

- (void)cancelFacialBiometryScreenWithResponse:(IMResponse *)response;

@end
