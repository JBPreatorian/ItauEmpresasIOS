//
//  WebViewPluginProtocol.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 1/24/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocolChainStatus.h"

@protocol WebViewPluginProtocol <NSObject>

@property (nonatomic, assign, readonly) ProtocolChainStatus chainStatus;

@end
