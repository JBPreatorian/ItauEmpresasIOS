//
//  IMBackendClient+SMS.h
//  SDKiOSCore
//
//  Created by Christian Perrone on 12/12/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import "IMBackendClient.h"

@protocol IMSMSManagerDelegate;

@interface IMBackendClient (SMS) <IMSMSManagerDelegate>

- (void) handleSMSWithResponse:(IMResponse *)response
                      security:(IMResponseSecurity*)security
                  successBlock:(IMCompletionBlock)success
                  failureBlock:(IMCompletionBlock)failure;

- (void)cancelSMSScreenWithResponse:(IMResponse *)response;

@end
