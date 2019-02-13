//
//  IMBackendClient+CardPassword.h
//  SDKiOSCore
//
//  Created by CIT Rodrigo Corcino da Nobrega on 17/05/17.
//  Copyright © 2017 Itau. All rights reserved.
//

#import "SDKiOSCore.h"

@protocol IMCardPasswordManagerDelegate;

@interface IMBackendClient (CardPassword) <IMCardPasswordManagerDelegate>

- (void)handlePasswordResponse:(IMResponse *)response
                         opkey:(NSString *)opkey
                  securityData:(IMResponseSecurity *)security
                  successBlock:(IMCompletionBlock)success
                  failureBlock:(IMCompletionBlock)failure;
- (void)cancelPasswordScreenWithResponse:(IMResponse *)response;

@end
