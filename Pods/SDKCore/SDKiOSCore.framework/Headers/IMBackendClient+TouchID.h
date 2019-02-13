//
//  IMBackendClient+TouchID.h
//  SDKiOSCore
//
//  Created by Christian Perrone on 14/12/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import "IMBackendClient.h"

@protocol IMTouchIDManagerDelegate;

@interface IMBackendClient (TouchID) <IMTouchIDManagerDelegate>

- (void) handleTouchIDResponse: (NSString *) credential
                  successBlock: (IMCompletionBlock) success
                  failureBlock: (IMCompletionBlock) failure;

- (void) handleTouchIDPasswordWithResponse:(IMResponse *)response
                                  security:(IMResponseSecurity*)security
                              successBlock:(IMCompletionBlock)successBlock
                              failureBlock:(IMCompletionBlock)failureBlock
                             isPrimaryFlow:(BOOL)isPrimaryFlow;
    
- (void)registerTouchID:(IMCompletionBlock)successBlock
           failureBlock:(IMCompletionBlock)failureBlock;

-(void) removeTouchID: (IMCompletionBlock) success
         failureBlock: (IMCompletionBlock) failure;

@end
