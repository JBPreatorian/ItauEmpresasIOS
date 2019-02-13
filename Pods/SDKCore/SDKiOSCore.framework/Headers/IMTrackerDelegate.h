//
//  IMTrackerDelegate.h
//  SDKiOSCore
//
//  Created by Diego Francisco Lechado on 09/09/17.
//  Copyright © 2017 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMTrackerDelegate <NSObject>

- (void) trackScreen:(NSString *) screenName withKeyValues:(NSDictionary *) keyValues;
- (void) trackScreen:(NSString *) screenName withSection:(NSString *) section andKeyValues:(NSDictionary *) keyValues;
- (void) trackScreen:(NSString *) screenName withSection:(NSString *) section AndSubsection1:(NSString *) subSection1 andKeyValues:(NSDictionary *) keyValues;;
- (void) trackScreen:(NSString *) screenName withSection:(NSString *) section AndSubsection1:(NSString *) subSection1 AndSubsection2:(NSString *) subSection2 andKeyValues:(NSDictionary *) keyValues;
- (void) trackAction:(NSString *) action withLabel:(NSString *) label andValue:(NSString *)value andCategory:(NSString *)category;
- (void) trackAction:(NSString *) name withKeyValues:(NSDictionary *) keyValues;
- (void) trackEvent:(NSString *) events;

@end
