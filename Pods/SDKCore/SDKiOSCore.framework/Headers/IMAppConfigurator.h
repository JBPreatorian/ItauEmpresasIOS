//
//  SDKAppConfigurator.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 5/28/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

extern DDLogLevel const ddLogLevel;

@protocol WebViewPluginProtocol;

@interface IMAppConfigurator: NSObject

+ (void)configureAppLogs;
+ (BOOL)configureAppWithActivationKey:(NSString *)key
                       andLicensePath:(NSString *)licPath
                                error:(NSError **)error;

+ (BOOL)configureAppWithActivationKey:(NSString *)key
                       andLicensePath:(NSString *)licPath
                   stringForUserAgent:(NSString *)stringUA
                                error:(NSError **)error;
+ (void)registerWebViewPlugin:(id<WebViewPluginProtocol>)plugin;
+ (NSMutableSet<id<WebViewPluginProtocol>> *)registeredWebViewPlugins;

@end
