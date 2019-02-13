//
//  TokensModelContainer.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 1/5/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import "IMResponseSecurity.h"
#import <Foundation/Foundation.h>

@interface TokensModelContainer: NSObject
@property (nonatomic, assign) NSInteger           selectedIdx;
@property (nonatomic, strong) IMResponseSecurity  *securityData;
@property (nonatomic, strong) NSMutableDictionary *configurableObjects;
@property (nonatomic, assign) BOOL                didSendSMSToken;
@property (nonatomic, strong) NSString            *opkey;

- (BOOL)isRegisterTokenOpKey;
@end
