//
//  IMValidateTokenNotificationManager.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 1/20/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMValidateTokenNotificationManagerDelegate<NSObject>
@required
- (void)startValidateToken;
- (void)stopValidateToken:(BOOL)success;
@optional
- (void)startSecondsRemainingWaiting:(NSInteger)secondsRemaining;
- (void)finishSecondsRemainingWaiting:(BOOL)canceled;
@end

@interface IMValidateTokenNotificationManager: NSObject

@property (nonatomic, strong) id<IMValidateTokenNotificationManagerDelegate> delegate;

- (void)startValidateToken;
- (void)stopValidateToken:(BOOL)success;
- (void)startSecondsRemainingWaiting:(NSInteger)secondsRemaining;
- (void)finishSecondsRemainingWaiting:(BOOL)canceled;

@end
