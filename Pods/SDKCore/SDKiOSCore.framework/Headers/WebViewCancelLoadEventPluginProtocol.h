//
//  WebViewCancelLoadPhasePlugin.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 1/23/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewPluginProtocol.h"

@protocol WebViewCancelLoadEventPluginProtocol <WebViewPluginProtocol>

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end
