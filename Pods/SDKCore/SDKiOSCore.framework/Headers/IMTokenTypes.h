//
//  IMTokenTypes.h
//  SDKToken
//
//  Created by Alexandre Garrefa on 7/22/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#ifndef SDKToken_IMTokenTypes_h
#define SDKToken_IMTokenTypes_h
#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    IMTokenTypeSMS = 0,
    IMTokenTypeKeyHolder,
    IMTokenTypeApp,
    IMTokenTypeAutentication
} IMTokenType;

typedef enum : NSInteger {
    IMTokenInvalidCodeSMS = 0,
    IMTokenInvalidCodeKeyHolder,
    IMTokenInvalidCodeApp,
} IMTokenInvalidCode;

#endif
