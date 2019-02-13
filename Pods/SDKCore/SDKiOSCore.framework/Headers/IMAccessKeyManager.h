//
//  IMAccessKeyManager.h
//  SDKiOSCore
//
//  Created by Fernanda Geraissate on 21/06/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMBlockTypes.h"
#import "IMUISDKProtocols.h"

@interface IMAccessKeyManager: NSObject

@property (weak, nonatomic) Class<IMElectronicPasswordUIInterfaceDelegate> electronicPasswordInterfaceDelegate;

@property (weak, nonatomic) Class<IMUISDKInterfaceLoadingDelegate> interfaceLoadingDelegate;

@property (weak, nonatomic) Class<IMUISDKAlertDelegate> alertInterfaceDelegate;

+ (instancetype)sharedManager;

- (void)registerWithPassword:(NSString *)password success:(IMCompletionBlock)successBlock failure:(IMCompletionBlock)failureBlock;

- (void)showElectronicPasswordViewController;

- (void)configureWithSuccessBlock:(IMCompletionBlock)successBlock failureBlock:(IMCompletionBlock)failureBlock;

@end
