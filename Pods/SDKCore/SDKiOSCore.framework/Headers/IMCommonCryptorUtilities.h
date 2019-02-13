//
//  IMCommonCryptorUtilities.h
//  IMCommonCryptor
//
//  Created by Isaac Stevao Sena on 8/19/15.
//  Copyright (c) 2015 Itau Unibanco. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

NSString *IMCCUHexadecimalString(NSData *data);

NSString* IMCommonCryptorUtilitiesPureNumbers(NSString *string);

NSString* IMCommonCryptorUtilitiesUUID();

NSString* IMCommonCryptorUtilitiesHTS(NSString *h);

NSString* IMCommonCryptorUtilitiesSTC(NSString *c);

Byte IMCommonCryptorUtilitiesSumToOneDigit(long long int n);
  
#ifdef __cplusplus
}
#endif