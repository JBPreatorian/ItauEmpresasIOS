//
//  IMAnalyticsObject.h
//  SDKiOSCore
//
//  Created by Fernanda Geraissate on 26/01/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import "AnalyticsConstants.h"
#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    PageView = 1,
    Event,
} AnalyticsType;

@interface IMAnalyticsObject: NSObject
@property (nonatomic, copy, readonly) NSString        *category;
@property (nonatomic, copy, readonly) NSString        *action;
@property (nonatomic, copy, readonly) NSString        *label;
@property (nonatomic, copy, readonly) NSNumber        *value;
@property (nonatomic, copy, readonly) NSString        *viewName;
@property (nonatomic, assign, readonly) AnalyticsType type;

- (instancetype)initWithViewName:(NSString *)viewName;
- (instancetype)initWithCategory:(NSString *)category
                           label:(NSString *)label
                          action:(NSString *)action
                           value:(NSNumber *)value;
@end
