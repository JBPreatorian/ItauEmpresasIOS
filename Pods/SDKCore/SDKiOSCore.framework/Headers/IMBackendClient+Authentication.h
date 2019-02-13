//
//  IMBackendClient+Authentication.h
//  SDKiOSCore
//
//  Created by Filipe Henrique Souza on 10/12/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import <SDKiOSCore/SDKiOSCore.h>

@interface IMBackendClient (Authentication)

- (void) authenticate:(IMClientParams*)params successBlock:(IMCompletionBlock)success failureBlock:(IMCompletionBlock)failure;

- (NSString *)clientID;

@end
