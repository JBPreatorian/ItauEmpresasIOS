//
//  NSString+IMCrypto.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/24/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IMCrypto)

+ (NSString *)sha1FromString:(NSString *)string;

- (NSDictionary *)sdk_decryptographedJSON;

@end
