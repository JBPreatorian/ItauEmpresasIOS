//
//  IMCardPasswordManagerDelegate.h
//  SDKiOSCore
//
//  Created by Rodrigo Corcino da Nobrega on 19/05/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMCardPasswordManagerDelegate<NSObject>

- (void)didEnterPassword:(NSString *)password finally:(void (^)(void))finally;

@end
