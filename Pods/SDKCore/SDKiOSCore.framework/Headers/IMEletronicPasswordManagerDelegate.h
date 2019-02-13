//
//  IMEletronicPasswordManagerDelegate.h
//  SDKiOSCore
//
//  Created by Christian Perrone on 06/12/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMEletronicPasswordManagerDelegate<NSObject>

- (void) didEnterEletronicPassword:(NSString*) password
                           finally:(void (^)(void))finally;
@end
