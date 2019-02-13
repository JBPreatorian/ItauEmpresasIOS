//
//  IMLocalStorageWebView.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 01/06/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMLocalStorageWebView : NSObject

- (NSString *_Nullable)valueForKey:(nonnull NSString *)key;
- (void)setValue:(nullable NSString *)value forKey:(nonnull NSString *)key;

@end
