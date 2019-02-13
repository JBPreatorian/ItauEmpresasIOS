//
//  IMCacheStorageProtocol.h
//  SDKiOSCore
//
//  Created by Bruno Fernandes on 11/05/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMCacheStorageProtocol <NSObject>

- (void)setData:(NSData *_Nonnull)data forKey:(NSString *_Nonnull)key;
- (void)setDictionary:(NSDictionary *_Nonnull)array forHash:(NSString *_Nonnull)hash session:(NSString *_Nonnull)session;
- (void)removeDictionaryForHash:(NSString *_Nonnull)hash session:(NSString *_Nonnull)session;
- (void)removeSessionKey:(NSString *_Nonnull)session;

- (NSData *_Nullable)dataForKey:(NSString *_Nonnull)key;
- (NSDictionary *_Nullable)dictionaryForKey:(NSString *_Nonnull)key;

@end
