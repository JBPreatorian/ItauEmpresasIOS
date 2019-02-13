//
//  IMClientParams.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/11/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "IMBaseModel.h"

typedef NS_ENUM (NSUInteger, IMLocalStorage) {
    IMLocalStorageMemory,
    IMLocalStorageDisk,
};

@interface IMClientParams: IMBaseModel

@property (nonatomic, copy) NSString     *method;
@property (nonatomic, copy) NSDictionary *query;
@property (nonatomic, copy) NSDictionary *path;
@property (nonatomic, copy) NSDictionary *header;
@property (nonatomic, copy) NSDictionary *body;
@property (nonatomic, assign) NSTimeInterval cacheDuration;
@property (nonatomic, assign) IMLocalStorage cacheStorage;

@property (nonatomic, assign, getter = isCryptoEnabled) BOOL cryptoEnabled;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
