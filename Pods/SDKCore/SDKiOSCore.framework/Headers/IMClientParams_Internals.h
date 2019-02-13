//
//  IMClientParams_Internals.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/11/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "SDKiOSCore.h"
#import "IMClientParams.h"

@interface IMClientParams ()

#pragma mark - Router Utils

@property (nonatomic, strong, readonly) NSDictionary *routerJSONDictionary;
@property (nonatomic, strong, readonly) NSArray      *routerHeader;
@property (nonatomic, strong, readonly) NSArray      *routerPath;
@property (nonatomic, strong, readonly) NSArray      *routerQuery;

@property (nonatomic, assign, getter = isDeviceIdEnabled) BOOL deviceIdEnabled;

#pragma mark - Validators

- (BOOL)validateMethods:(NSArray *)validMethods pathParameters:(BOOL)acceptPathParams queryParameters:(BOOL)acceptQueryParams;

@end
