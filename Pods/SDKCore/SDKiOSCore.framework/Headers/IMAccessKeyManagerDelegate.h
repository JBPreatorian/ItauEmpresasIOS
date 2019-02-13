//
//  IMAccessKeyManagerDelegate.h
//  SDKiOSUI
//
//  Created by Tales Pinheiro De Andrade on 13/01/17.
//  Copyright © 2017 Tales Pinheiro De Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMAccessKeyManagerDelegate<NSObject>

- (void)didEnterPassword:(NSString *)password finally:(void (^)(BOOL))finally;
- (void)closeScreen;

@end
