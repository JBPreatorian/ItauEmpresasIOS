//
//  IMResponse.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/13/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMResponse: NSObject

@property (nonatomic, copy) id          data;
@property (nonatomic, copy) NSError     *error;
@property (nonatomic, assign) NSInteger statusCode;
@property (nonatomic, copy) NSArray     *headers;

- (NSArray *)flow;

// Token
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) BOOL tokenIsValid;
@property (nonatomic, assign) BOOL tokenIsBlocked;
@property (nonatomic, assign) BOOL flowIsCancelled;
@property (nonatomic, assign) BOOL alternateFlow;

@end
