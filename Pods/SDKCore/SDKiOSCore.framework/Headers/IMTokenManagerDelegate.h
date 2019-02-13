//
//  IMTokenManagerDelegate.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 9/3/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "IMBlockTypes.h"
#import "IMTokenTypes.h"
#import <Foundation/Foundation.h>

@protocol IMTokenManagerDelegate<NSObject>

- (void)requestUnlockTokenWithSuccess:(IMCompletionBlock)success andFailure:(IMCompletionBlock)failure;
- (void)didEnterTokens:(NSArray *)tokens forType:(IMTokenType)type;
- (void)didEnterTokens:(NSArray *)tokens forType:(IMTokenType)type success:(TokenSuccessCompletionBlock)success failure:(TokenFailureCompletionBlock)failure;
- (void)didSelectedItemforType:(IMTokenType)type;
- (void)didEnterPassword:(NSString *)password finally:(void (^)(BOOL))finally;
- (void)cancelAndCloseTokenScreen;
- (void)cancelTokenScreenWithResponse:(IMResponse *)response;
- (void)closeTokenScreen;
- (void)handleResponse:(IMResponse *)responseObj withType:(IMTokenType)type;

@end
