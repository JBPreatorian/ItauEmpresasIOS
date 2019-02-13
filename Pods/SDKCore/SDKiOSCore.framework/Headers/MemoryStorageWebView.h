//
//  MemoryStorageWebView.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 1/31/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemoryStorageWebView : NSObject

- (void)saveValue:(NSString *)value usingKey:(NSString *)key;
- (NSString *)findValueUsingKey:(NSString *)key;
- (void)clearAll;
- (void)saveAll:(NSDictionary <NSString *, NSString *> *)values;

- (NSString *)objectForKeyedSubscript:(NSString *)key;
- (void)setObject:(NSString *)obj forKeyedSubscript:(NSString *)key;

@end
