//
//  IMFaceBiometryManagerDelegate.h
//  SDKiOSCore
//
//  Created by Filipe Henrique Souza on 09/11/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMFaceBiometryManagerDelegate<NSObject>

- (void) didCaptureFacialBiometry:(NSDictionary*)facialDictionary
                          finally:(void (^)(void))finally;

- (void) failedCaptureFacialBiometry:(NSDictionary*)facialDictionary
                             finally:(void (^)(void))finally;


@end
