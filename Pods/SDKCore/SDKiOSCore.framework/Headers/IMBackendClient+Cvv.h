//
//  IMBackendClient+Cvv.h
//  SDKiOSCore
//
//  Created by Henrique Silva Brighenti on 5/17/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import "SDKiOSCore.h"

@protocol IMCvvValidationDelegate;

@interface IMBackendClient (Cvv) <IMCvvValidationDelegate>

- (void)handleCvvResponse:(IMResponse *)response
                    opkey:(NSString *)opkey
             securityData:(IMResponseSecurity *)security
             successBlock:(IMCompletionBlock)success
             failureBlock:(IMCompletionBlock)failure;

- (void)validateCvv:(NSString *)code
         withCardId: (NSString *) cardId
       successBlock:(IMCompletionBlock)successBlock
       failureBlock:(IMCompletionBlock)failureBlock;

- (void)cancelCvvScreenWithResponse:(IMResponse *)response;

@end
