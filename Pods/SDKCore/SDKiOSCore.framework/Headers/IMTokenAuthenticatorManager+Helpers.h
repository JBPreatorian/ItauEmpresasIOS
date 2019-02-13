//
//  IMTokenAuthenticatorManager+Helpers.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 12/1/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMTokenAuthenticatorManager.h"

@interface IMTokenAuthenticatorManager (Helpers)

- (NSString *)tokenStringForSerialNumber:(NSString *)serialNumber;

+ (BOOL)isValidToken:(NSString *)token;
+ (BOOL)tokenIsNumber:(NSString *)token;



@end
