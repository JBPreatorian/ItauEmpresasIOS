//
//  IMSMSManagerDelegate.h
//  SDKiOSCore
//
//  Created by Christian Perrone on 12/12/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMSMSManagerDelegate <NSObject>

- (void) didEnterSMS: (NSString *) sms
             finally: (void (^)(void)) finally;

- (void) sendSMSRequest: (void (^)(void)) finally;

@end
