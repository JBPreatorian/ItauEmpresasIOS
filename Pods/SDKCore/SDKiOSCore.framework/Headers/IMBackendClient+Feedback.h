//
//  IMBackendClient+Feedback.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 12/1/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMBackendClient.h"

@interface IMBackendClient (Feedback)

- (void)sendFeedbackForApp:(NSString * _Nonnull)app
                  category:(NSInteger)category
                      guid:(NSString * _Nonnull)guid
  deviceInfoEmailCommentId:(NSString * _Nonnull)deviceInfoEmailCommentId
                   account:(NSString * _Nonnull)accountId
              successBlock:(IMCompletionBlock _Nullable)successBlock
              failureBlock:(IMCompletionBlock _Nullable)failure;
@end
