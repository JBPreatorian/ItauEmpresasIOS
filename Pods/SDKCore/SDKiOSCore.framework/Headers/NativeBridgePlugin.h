//
//  NativeBridgePlugin.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 1/27/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import "WebViewLoadEventPluginProtocol.h"
#import "WebViewPostLoadEventPluginProtocol.h"
#include "IMUISDKProtocols.h"

@interface NativeBridgePlugin : NSObject <WebViewPostLoadEventPluginProtocol, WebViewLoadEventPluginProtocol, IMTokenManagerDelegate>

@property(nonatomic, weak) Class<IMPasswordUIInterfaceDelegate> passwordInterfaceDelegate;
- (void)responseNativeFeature:(NSString *)response;
- (void)setItemInStorageUsingKey:(NSString *)key withValue:(NSString *)value;
- (NSString *)getItemValueFromStorageUsingKey:(NSString *)key;
- (BOOL)requestNativeFeature:(NSString *)request usingCallback:(NSString *)callbackMethodName;
- (void)adobeTrackState:(NSString *)pageName withValue:(NSString *)context;
- (void)adobeTrackAction:(NSString *)pageName withValue:(NSString *)context;
- (void)adjustTrackEvent:(NSString *)events;

@end
