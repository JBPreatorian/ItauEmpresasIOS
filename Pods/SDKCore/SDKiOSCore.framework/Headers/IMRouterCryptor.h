//
//  IMRouterCryptor.h
//  IMRouterCryptor
//
//  Created by Isaac Stevao Sena on 8/19/15.
//  Copyright (c) 2015 Itau Unibanco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(Byte, IMRouterCryptorOperation) {
  IMRouterCryptorOperationEncrypt,
  IMRouterCryptorOperationDecrypt
};

#ifdef __cplusplus
extern "C" {
#endif

void IMRouterCryptorCreate(NSString *licenseFileContent, NSString *activationKey, NSError **error);

void IMRouterCryptorUpdate(NSString *licenseFileContent, NSString *activationKey, NSError **error);

NSData* IMRouterCryptorFinal(IMRouterCryptorOperation operation, id object, NSError **error);

void IMRouterCryptorReset();

NSData* IMRouterCryptor(IMRouterCryptorOperation operation, id object, NSString *licenseFileContent, NSString *activationKey, NSError **error);

#ifdef __cplusplus
}
#endif
