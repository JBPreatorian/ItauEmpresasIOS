//
//  IMUrlQueryBuilder.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 10/19/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMUrlQueryBuilder: NSObject

+ (NSString *)queryWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)queryWithIDU:(NSString *)idU op:(NSString *)op parameters:(NSArray *)parameters;

@end
