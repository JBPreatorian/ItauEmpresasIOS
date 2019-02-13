//
//  IMMotorManager.h
//  SDKiOSCore
//
//  Created by Carlos A Savi on 30/05/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import "IMBlockTypes.h"
#import "IMMotorManagerDelegate.h"
#include "IMUISDKProtocols.h"

@class IMResponseSecurity;
@class IMResponse;

@interface IMMotorManager : NSObject<IMMotorManagerDelegate>

@property(nonatomic, weak) Class<IMMotorUIInterfaceDelegate> motorInterfaceDelegate;

//+ (void)configureWithResponse:(IMResponse *)response
//                 successBlock:(IMCompletionBlock)success
//                 failureBlock:(IMCompletionBlock)failure;

+ (instancetype)sharedManager;

+ (void)showMotorFlowForSecurityData:(IMResponseSecurity *)security andOpkey:(NSString *)opkey;

+ (void)configureWithResponse:(IMResponse *)response successBlock:(IMCompletionBlock)success failureBlock:(IMCompletionBlock)failure;

@end
