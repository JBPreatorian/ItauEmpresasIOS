//
//  IMResponseSecurity.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 9/1/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "IMApplicationToken.h"
#import "IMTokenAppData.h"
#import "IMBaseModel.h"

@interface IMResponseSecurity: IMBaseModel

// MOTOR DE RISCO
@property (nonatomic, assign) BOOL transactionBlocked;
@property (nonatomic, assign) BOOL offerTokenAppInstalation;
@property (nonatomic, assign) BOOL offerClientCallURA;
- (BOOL)transactionIsBlocked;

@property (nonatomic, copy) NSString *rsa2048Key;
@property (nonatomic, copy) NSString *passwordText;
@property (nonatomic, copy) NSNumber *passwordLength;
@property (nonatomic, copy) NSString *tokenKeySerialNumber;
@property (nonatomic, copy) NSString *tokenSMSSerialNumber;
@property (nonatomic, copy) NSString *tokenAppSerialNumber;
@property (nonatomic, copy) NSString *tokenSMSPhoneNumber;

@property (nonatomic, copy) NSDictionary *uiModel;

@property (nonatomic, strong) IMTokenAppData     *tokenAppData;
@property (nonatomic, strong) IMApplicationToken *applicationToken;

@property (nonatomic, assign) BOOL showMsgTokenNotNeeded;
@property (nonatomic, assign) BOOL passwordNeeded;
@property (nonatomic, assign) BOOL deviceNeeded;
@property (nonatomic, assign) BOOL cvvNeeded;
@property (nonatomic, strong) NSString *cvvPurpose;
@property (nonatomic, strong) NSArray<NSString *> *validationSequence;

// CONFIRMATION

@property (nonatomic, strong) NSString *confirmationMsg;
@property (nonatomic, assign) BOOL     success;
@property (nonatomic, assign) BOOL     tokenValid;
@property (nonatomic, assign) BOOL     tokenValidButBlocked;

- (void)addConfirmationDictionary:(NSDictionary *)confirmation;
- (BOOL)hasSmsAndKeyholderTokensOnly;
- (NSArray *)tokenTypes;
- (BOOL)checkNeedToRemoveTokenApp;
- (BOOL)areSerialNumberInvalids;
- (void)removeTokenApp;
- (BOOL)hasValidationSequence;

@end
