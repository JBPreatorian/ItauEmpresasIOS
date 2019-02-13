//
//  RemoteBundle.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 12/28/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMBaseModel.h"

@interface RemoteBundle: IMBaseModel

@property (nonatomic, copy) NSString     *bundlehash;
@property (nonatomic, copy) NSDictionary *data;

- (BOOL)isValid;

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
- (NSArray *)arrayForKey:(NSString *)key defaultValue:(NSArray *)defaultValue;
- (NSNumber *)numberForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue;
- (BOOL)boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue;

@end
