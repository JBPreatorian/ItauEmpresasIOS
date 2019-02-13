//
//  IMBackendClient+AccessKey.h
//  SDKiOSCore
//
//  Created by Fernanda Geraissate on 20/06/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import "SDKiOSCore.h"
#import "IMBackendClient.h"

@interface IMBackendClient (AccessKey)

- (void)loginIDWithIdentifier:(NSString * _Nonnull)identifier
                 successBlock:(IMCompletionBlock _Nonnull)successBlock
                 failureBlock:(IMCompletionBlock _Nonnull)failureBlock NS_SWIFT_NAME(loginId(identifier:success:failure:));

- (void)registerIDWithSuccessBlock:(IMCompletionBlock _Nonnull)successBlock
                      failureBlock:(IMCompletionBlock _Nonnull)failureBlock NS_SWIFT_NAME(registerId(success:failure:));
    
- (void)registerCardIDWithSuccessBlock:(IMCompletionBlock _Nonnull)successBlock
                          failureBlock:(IMCompletionBlock _Nonnull)failureBlock NS_SWIFT_NAME(registerCardId(success:failure:));

- (void)unregisterIDWithSuccessBlock:(IMCompletionBlock _Nonnull)successBlock
                        failureBlock:(IMCompletionBlock _Nonnull)failureBlock NS_SWIFT_NAME(unregisterId(success:failure:));

- (void)queryIDTypeWithSuccessBlock:(IMCompletionBlock _Nonnull)successBlock
                       failureBlock:(IMCompletionBlock _Nonnull)failureBlock NS_SWIFT_NAME(queryIdType(success:failure:));

- (BOOL)hasIDWithIdentifier:(NSString * _Nonnull)identifier NS_SWIFT_NAME(has(identifier:));

@end
