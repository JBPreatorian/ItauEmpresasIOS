//
//  IMBackendClient+EletronicPassword.h
//  SDKiOSCore
//
//  Created by Christian Perrone on 06/12/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import "IMBackendClient.h"

@protocol IMEletronicPasswordManagerDelegate;

@interface IMBackendClient (EletronicPassword) <IMEletronicPasswordManagerDelegate>

- (void)handleEletronicPasswordResponse:(NSString *) teclado
                        successBlock:(IMCompletionBlock)success
                        failureBlock:(IMCompletionBlock)failure;

- (void)cancelEletronicPasswordScreenWithResponse:(IMResponse *)response;

@end
