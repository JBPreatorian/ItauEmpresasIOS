//
//  IMCommonCryptor.h
//  IMCommonCryptor
//
//  Created by Isaac Stevao Sena on 8/18/15.
//  Copyright (c) 2015 Itau Unibanco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonKeyDerivation.h>
#import <CommonCrypto/CommonCryptor.h>

typedef NS_ENUM(NSInteger, IMCommonCryptorSHAReturnType) {
    IMCommonCryptorSHAReturnTypeData,
    IMCommonCryptorSHAReturnTypeBase64,
    IMCommonCryptorSHAReturnTypeHex
};

typedef NS_ENUM(NSInteger, IMCommonCryptorAlgorithmSHA) {
    IMCommonCryptorAlgorithmSHA128,
    IMCommonCryptorAlgorithmSHA256
};

typedef struct {
    CCAlgorithm algorithm;
    size_t blockSize;
    size_t IVSize;
    CCOptions options;
} IMCommonCryptorSettings;

typedef struct {
    size_t keySize;
    size_t saltSize;
    CCPBKDFAlgorithm PBKDFAlgorithm;
    CCPseudoRandomAlgorithm pseudoRandomAlgorithm;
    uint rounds;
} IMCommonCryptorKeySettings;

const static IMCommonCryptorKeySettings kDefaultKey128Settings = {
    .keySize = kCCKeySizeAES128,
    .saltSize = 8 * 2,
    .PBKDFAlgorithm = kCCPBKDF2,
    .pseudoRandomAlgorithm = kCCPRFHmacAlgSHA1,
    .rounds = 1000
};

const static IMCommonCryptorKeySettings kDefaultKey256Settings = {
    .keySize = kCCKeySizeAES256,
    .saltSize = 8 * 2,
    .PBKDFAlgorithm = kCCPBKDF2,
    .pseudoRandomAlgorithm = kCCPRFHmacAlgSHA1,
    .rounds = 1000
};

const static IMCommonCryptorSettings kDefaultSettings = {
    .algorithm = kCCAlgorithmAES128,
    .blockSize = kCCBlockSizeAES128,
    .IVSize = kCCBlockSizeAES128,
    .options = kCCOptionPKCS7Padding
};

const static IMCommonCryptorSettings kDefaultSettingsWithNoPadding = {
    .algorithm = kCCAlgorithmAES128,
    .blockSize = kCCBlockSizeAES128,
    .IVSize = kCCBlockSizeAES128,
    .options = 0x0000 // no padding block
};

#ifdef __cplusplus
extern "C" {
#endif

NSData* IMCommonCryptorCrypt(CCOperation operation, NSData *data, NSData *key, NSData *iv, IMCommonCryptorSettings cryptorSettings, size_t dataOutAvailable, NSError **error);

NSData* IMCommonCryptorAESKey(NSData *password, NSData *salt, IMCommonCryptorKeySettings keySettings, NSError **error);

NSData* IMCommonCryptorRandom(size_t length, NSError **error);

NSData* IMCommonCryptorSHA(id input, IMCommonCryptorAlgorithmSHA sha, IMCommonCryptorSHAReturnType returnType);

#ifdef __cplusplus
}
#endif
