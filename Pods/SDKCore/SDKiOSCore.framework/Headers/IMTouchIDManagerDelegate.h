//
//  IMTouchIDManagerDelegate.h
//  SDKiOSCore
//
//  Created by Christian Perrone on 14/12/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMTouchIDManagerDelegate <NSObject>

- (void) didEnterTouchID: (void(^)(BOOL isEnabled, NSData * domainState))completion;
- (void) didEnterTouchIDPassword: (NSString *) password;
@end
