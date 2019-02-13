//
//  IMErrorResponseFactory.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 12/4/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMErrorFactory.h"
#import "IMResponse.h"
#import <Foundation/Foundation.h>

@interface IMErrorResponseFactory: NSObject

+ (IMResponse *)responseForErroCode:(IMErrorCode)code;
+ (IMResponse *)responseForError:(NSError *)error;
+ (IMResponse *)tokenAppValidationError:(IMResponse *)responseObj;
+ (IMResponse *)tokenAppErrorToSecondRemaining:(NSString *)secondsRemaining;

@end
