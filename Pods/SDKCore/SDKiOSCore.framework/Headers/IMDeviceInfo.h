//
//  IMDeviceInfo.h
//  SDKiOSCore
//
//  Created by Fabio Miciano on 14/11/17.
//  Copyright © 2017 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface IMDeviceInfo : NSObject

+(NSString*) machineName;
+(NSString*) deviceInfos;
+(NSString *)versionApp;
+(BOOL)versionIsSmallerThan:(NSString*)version;

/**
 *  Metodo para saber se o iphone utilizado é o 4/4s.
 *
 *  @return Boolean indicando se é o iphone 4/4s.
 */
+ (BOOL)is_iPhone4;

/**
 *  Metodo para saber se o iphone utilizado é o 5/5c/5s.
 *
 *  @return Boolean indicando se é o iphone 5/5c/5s.
 */
+ (BOOL)is_iPhone5;

/**
 *  Metodo para saber se o iphone utilizado é o 6/6s/7.
 *
 *  @return Boolean indicando se é o iphone 6/6s/7.
 */
+ (BOOL)is_iPhone6;

/**
 *  Metodo para saber se o iphone utilizado é o 6Plus/6sPlus//7Plus.
 *
 *  @return Boolean indicando se é o iphone 6Plus/6sPlus/7Plus.
 */
+ (BOOL)is_iPhone6Plus;

/**
 *  Metodo para saber se o iphone utilizado é o X.
 *
 *  @return Boolean indicando se é o iphone X.
 */
+ (BOOL)is_iPhoneX;

@end
