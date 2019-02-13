//
//  NSString+Matcher.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 2/1/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Matcher)

- (NSArray<NSString *> *)matchWithRegex:(NSString *)regex;

@end
