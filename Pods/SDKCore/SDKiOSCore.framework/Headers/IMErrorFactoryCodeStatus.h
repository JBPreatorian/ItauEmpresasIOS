//
//  IMErrorFactoryCodeStatus.h
//  SDKiOSCore
//
//  Created by Fernanda Geraissate on 05/07/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMErrorFactoryCodeStatus: NSObject

typedef NS_ENUM (NSInteger, IMErrorCode) {
    IMErrorCodeUndefined,
    IMErrorCodeInvalidBuildConfiguration,
    IMErrorCodeEmptySecurityData,
    IMErrorCodeInvalidSecurityData,
    IMErrorCodeIdleSessionTimeOut,
    IMErrorCodeSessionTimeOut,
    IMErrorCodeTokenAppValidation,
    IMErrorCodeTokenAppSecondsRemaining,
    IMErrorCodeTokenAppSecondsRemainingCanceled,
    IMErrorCodeInvalidAppVersion,
    IMErrorCodeNotConformToProtocol,
    IMErrorCodeNotRespondsToSelector,
    IMErrorCodeSimultaneousSession,
    IMErrorCodeInvalidArgument
};

@end
