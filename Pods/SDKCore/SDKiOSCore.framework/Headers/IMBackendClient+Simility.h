//
//  IMBackendClient+Simility.h
//  SDKiOSCore
//
//  Created by Filipe Henrique Souza on 05/11/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import "IMBackendClient.h"

@interface IMBackendClient (Simility)

- (void) sendEvent:(NSString *)eventType NS_SWIFT_NAME(send(event:));

@end
