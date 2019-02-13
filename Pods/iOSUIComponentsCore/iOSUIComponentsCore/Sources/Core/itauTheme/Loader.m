//
//  Loader.m
//  ItauTheme
//
//  Created by Marcos Massayuki Kobuchi on 05/04/18.
//  Copyright (c) 2017-2018 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface Loader : NSObject
@end

@implementation Loader

+ (void)load {
    // Get bundle for framework
    NSBundle *bundle = [NSBundle bundleForClass:self];

    // Get urls for all fonts
    NSArray *urls = [bundle URLsForResourcesWithExtension:@"ttf" subdirectory:@"ItauTheme.bundle"];
    
    // In case of the fonts are already registered, first unregister them from font manager
    CTFontManagerUnregisterFontsForURLs((__bridge CFArrayRef)urls, kCTFontManagerScopeProcess, nil);

    // Register fonts for all urls
    CTFontManagerRegisterFontsForURLs((__bridge CFArrayRef)urls, kCTFontManagerScopeProcess, nil);
}

@end
