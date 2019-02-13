//
//  IMUserDefaults.h
//  IMUserDefaults
//
//  Created by Isaac Stevao Sena on 7/24/15.
//  Copyright (c) 2015 Itau Unibanco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IMUserDefaultsStatus) {
    IMUserDefaultsStatusNotDefined,
    IMUserDefaultsStatusNotSynchronized,
    IMUserDefaultsStatusLocalSynchronizedButSuiteNotSynchronized,
    IMUserDefaultsStatusSuiteSynchronizedButLocalNotSynchronized,
    IMUserDefaultsStatusSynchronized,
    IMUserDefaultsStatusKeyLoaded,
    IMUserDefaultsStatusDefaultNameNull,
    IMUserDefaultsStatusCryptFail
};

@interface IMUserDefaults : NSObject

+ (BOOL)setLocalObject:(id)value
                   forKey:(NSString *)defaultName;

+ (IMUserDefaultsStatus)synchronizeObject:(id)value
                                   forKey:(NSString *)defaultName;

+ (IMUserDefaultsStatus)synchronizeRemoveForKey:(NSString *)defaultName;

+ (id)objectForKey:(NSString *)defaultName;

@end
