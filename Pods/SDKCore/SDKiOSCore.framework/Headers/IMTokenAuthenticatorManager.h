//
//  IMTokenAuthenticatorManager.h
//  IMTokenAuthenticator
//
//  Created by Isaac Stevao Sena on 06/11/13.
//  Copyright (c) 2013 Itaú-Unibanco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMTokenAuthenticatorManager : NSObject

+ (IMTokenAuthenticatorManager *)sharedManager;

- (BOOL)legacyData:(NSString *)tokenData error:(NSError **)error;

- (BOOL)handleAppData:(NSDictionary *)tokenAppData error:(NSError **)error;

- (NSDictionary *)handleFallback:(NSDictionary *)data error:(NSError **)error;

- (NSDictionary *)tokenForSerialNumber:(NSString *)serialNumber;

- (NSArray *)tokensForBlock:(NSString *)serialNumber;

- (NSDictionary *)tokenOffline;

- (NSString *)feedback:(NSString *)messageFormat;

- (void)timeSync:(NSString *)serverTimeStr;

- (void)reset;

- (void)cacheSerialNumber:(NSString *)serialNumber;

- (NSString *)decryptCodeString:(NSString *)string error:(NSError **)error;

- (NSDictionary *)getAppleWatchData:(NSError **)error;

- (void)saveAppleWatchData:(NSDictionary *)dic withError:(NSError **)error;

@end

#ifdef __cplusplus
extern "C" {
#endif

NSString* IMTokenAuthenticatorIdentifier(NSError** error);
    
NSString* IMTokenAuthenticatorIdentifierW(NSError** error);
    
#ifdef __cplusplus
}
#endif
